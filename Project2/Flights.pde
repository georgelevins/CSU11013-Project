class Flight
{
Table table;
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
int CANCELLED;
int DIVERTED;
int DISTANCE;

Flight(int rowNumber)
{
  table = loadTable("flights2k(1).csv", "header");
  TableRow row = table.getRow(rowNumber);
  MKT_CARRIER = row.getString("MKT_CARRIER");
  MKT_CARRIER_FL_NUM = row.getInt("MKT_CARRIER_FL_NUM");
  ORIGIN = row.getString("ORIGIN");
  ORIGIN_CITY_NAME = row.getString("ORIGIN_CITY_NAME");
  ORIGIN_STATE_ABR = row.getString("ORIGIN_STATE_ABR");
  ORIGIN_WAC = row.getInt("ORIGIN_WAC");
  DEST = row.getString("DEST");
  DEST_CITY_NAME = row.getString("DEST_CITY_NAME");
  DEST_STATE_ABR = row.getString("DEST_STATE_ABR");
  CRS_DEP_TIME = row.getInt("CRS_DEP_TIME");
  DEP_TIME = row.getInt("DEP_TIME");
  CRS_ARR_TIME = row.getInt("CRS_ARR_TIME");
  ARR_TIME = row.getInt("ARR_TIME");
  CANCELLED = row.getInt("CANCELLED");
  DIVERTED = row.getInt("DIVERTED");
  DISTANCE = row.getInt("DISTANCE");
  
}
}
