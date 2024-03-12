Table table;

//void setup()
//{
  
// // Loads file into a table
 
// table = loadTable("flights2k(1).csv", "header");
// int rowCount = table.getRowCount();
// println(rowCount);
 
// for (int i = 0; i<rowCount; i++)
// {
//  TableRow row = table.getRow(i);
//  String MKT_CARRIER_FL_NUM = row.getString("MKT_CARRIER_FL_NUM");
//  if (i == rowCount/2)println(MKT_CARRIER_FL_NUM);
// }
 
// //
 
//}

void setup() {
 table = loadTable("flights2k(1).csv", "header");
 
 println(table.getRowCount() + " total rows in table");
 
 for (TableRow row : table.rows() ) {
   
   String FL_DATE = row.getString("FL_DATE");
   
   println(FL_DATE);
 }
}
