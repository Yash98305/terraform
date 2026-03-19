provider "google"{
    project = "project-08f2108d-d407-462b-808"
    region  = "us-central1"

}
variable "datasets" {
   
  
}
locals{
    datasets = var.datasets
    //flatten is used to convert the nested list of tables into a single list of tables with dataset_name, table_id, and schema_file as attributes. This allows us to easily iterate over all tables regardless of their dataset.
    tables = flatten([for dataset_id, tables in var.datasets : [
        for table in tables : {
            //dataset_id is the name of the dataset which is the key in the datasets map
            dataset_id = dataset_id  
            //table_id is the id of the table which is an attribute of the table object in the list of tables for each dataset
            table_id     = table.table_id 
            schema_file  = table.schema_file
        }
    ]])
}
resource "google_bigquery_dataset" "datasets" {
    for_each = local.datasets
    dataset_id = each.key //here key is datasetname 
}
resource "google_bigquery_table" "tables" {
    for_each = {for table in local.tables : "${table.dataset_id}.${table.table_id}" => table}
    dataset_id = each.value.dataset_id
    table_id   = each.value.table_id
    schema     = file(each.value.schema_file)
    depends_on = [ google_bigquery_dataset.datasets ]
}