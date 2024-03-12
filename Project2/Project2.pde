
CarrierName plane;
OriginCity name;
// initialise for every category
Table table;

void setup() {
   name = new OriginCity();
   plane = new CarrierName();
  
    table = loadTable("flights2k(1).csv", "header");
  println(table.getRowCount() + " total rows in table");
  
   name.printOriginCity();
   plane.printCarrier();
   
  
   }
  
