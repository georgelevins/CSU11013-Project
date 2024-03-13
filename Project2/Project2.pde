Flight flight1;
void setup()
{
  /// INPUT ROW NUMBER INTO FLIGHT() TO CHOOSE FLIGHT
 flight1 = new Flight(1);
 println("MKT_CARRIER; " + flight1.MKT_CARRIER);
 println("MKT_CARRIER_FL_NUM; " +flight1.MKT_CARRIER_FL_NUM);
 println("ORIGIN; " +flight1.ORIGIN);
 println("ORIGIN_CITY_NAME; " +flight1.ORIGIN_CITY_NAME);
 println("ORIGIN_STATE_ABR; " +flight1.ORIGIN_STATE_ABR);
 println("ORIGIN_WAC; " +flight1.ORIGIN_WAC);
 println("DEST; " +flight1.DEST);
 println("DEST_CITY_NAME; " +flight1.DEST_CITY_NAME);
 println("DEST_STATE_ABR; " +flight1.DEST_STATE_ABR);
 println("CRS_DEP_TIME; " +flight1.CRS_DEP_TIME);
 println("DEP_TIME; " +flight1.DEP_TIME);
 println("CRS_ARR_TIME; " +flight1.CRS_ARR_TIME);
 println("ARR_TIME; " +flight1.ARR_TIME);
 println("CANCELLED; " +flight1.CANCELLED);
 println("DIVERTED; " +flight1.DIVERTED);
 println("DISTANCE; " +flight1.DISTANCE);
 
}
