String price="";
int Tprice=0;
String y="";
String code="12";
String date="01"+"\\"+"02"+"\\"+"2023";
String transaction="suud1234";
String branch="";
String data[]=new String[0];
String dat[]=new String[0];
import static  javax.swing.JOptionPane.*;
String path="C:/Users/Win 10 Pro/Documents/Processing/factory.csv";
String path1="C:/Users/Win 10 Pro/Documents/Processing/factory2.csv";
String path2="C:/Users/Win 10 Pro/Documents/Processing/factorydata.csv";
String contents[]=loadStrings(path1);
String a=contents[0];
String places[]=split(a, ",");
for (int x=1; x<places.length; x++) {
  String head=str(x)+"."+places[x];
  data=append(data, head);
}
Table table=loadTable(path, "header");
Table table1=loadTable(path1, "header");
Table table2=loadTable(path2, "header");
for (int x=0; x<table.getRowCount(); x++) {
  String da=str(x+1)+"."+table.getString(x, "ppc");
  dat=append(dat, da);
}
String place=showInputDialog("please select the place from where you want to take the cement\n1.factory\n2.supplier");
if (int(place)==1||int(place)==2) {
  if (place.equals("2")) {
    branch=showInputDialog(dat);
  } 

  String typeofcement=showInputDialog("1.ppc\n2.opc");
  if (int(typeofcement)==1||int(typeofcement)==2) {
    String factory=showInputDialog(data);
    for (int z=1; z<table.getColumnCount(); z++) {
      if (int(factory)==z) {


        String amount=showInputDialog("enter the amount");
        if (int(amount)<1000&&int(amount)>100) {
        } else {
          for (int x=0; x>=0; x++) {
            amount=showInputDialog("please enter again the amount between 100 and 1000 ");
            if (int(amount)<1000&&int(amount)>100) {
              break;
            }
          }
        }
        if (place.equals("1")&&typeofcement.equals("1")) {
          price=table2.getString(0, z);
          Tprice=int(price)*int(amount);
          print(Tprice);
        } else if (place.equals("1")&&typeofcement.equals("2")) {
          price=table2.getString(1, z);
          Tprice=int(price)*int(amount);
          print(Tprice);
        } else if (place.equals("2")&&typeofcement.equals("1")) {
          int branch1=int(branch)-1;
          int factory1=int(factory);
          price=table.getString(branch1, factory1);
          Tprice=int(price)*int(amount);
        } else if (place.equals("2")&&typeofcement.equals("2")) {
          int branch1=int(branch)-1;
          int factory1=int(factory);
          price=table1.getString(branch1, factory1);
          Tprice=int(price)*int(amount);
        }
        showMessageDialog(frame, "the total price is "+Tprice+" pay with tellebirr by using 0947853943 and send the transaction number");
        String transactionnumber=showInputDialog("enter the transaction number");
        if (transaction.equals(transactionnumber)) {
          showMessageDialog(frame, "you have succesfully paied the price");
        } else {
          for (int x=0; x>=0; x++) {
            transactionnumber=showInputDialog("not match please enter again the transaction number");
            if (transaction.equals(transactionnumber)) {
              showMessageDialog(frame, "you have succesfully paied the price");
              break;
            }
          }
        }
        if (place.equals("1")) {
          showMessageDialog(frame, "you can take the cement from its factory by "+code+" code on "+date);
        } else if (place.equals("2")) {
          showMessageDialog(frame, "you can take the cement from the branch by "+code+" code on "+date);
        }
      }
    }
  }
}
exit();
