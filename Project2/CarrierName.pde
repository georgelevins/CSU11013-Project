class CarrierName {
void printCarrier() {
 
  for (TableRow row : table.rows()){
    String carrier = row.getString("MKT_CARRIER");
    println(carrier);
  }
}

}
