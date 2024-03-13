Table table;

class Flight
{
TableRow row;
String MKT_CARRIER;
int MKT_CARRIER_FL_NUM;
String ORIGIN;
String ORIGIN_CITY_NAME;
String ORIGIN_STATE_ABR;
int ORIGIN_WAC;
String DEST;
String DEST_CITY_NAME;
String DEST_STATE_ABR;
int DEST_WAC;
int CRS_DEP_TIME;
int DEP_TIME;
int CRS_ARR_TIME;
int ARR_TIME;
boolean CANCELLED;
boolean DIVERTED;
int DISTANCE;
}




Flight flight1;
void setup()
{
 table = loadTable("flights2k(1).csv", "header");
 int rowCount = table.getRowCount();
 println(rowCount);
 flight1 = new Flight();
 flight1.row = table.getRow(1);
 
 for (int i = 0; i<rowCount; i++)
 {
  TableRow row = table.getRow(i);
  String MKT_CARRIER_FL_NUM = row.getString("MKT_CARRIER_FL_NUM");
  if (i == rowCount/2)println(MKT_CARRIER_FL_NUM);
 }
}
