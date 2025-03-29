//ประกาศ static เพื่อให่สามารถเรียกใช้งานได้เลยไม่ต้อง คอนสตักเตอร์
class  Student {
  static List<Map<String,dynamic>> studentItems = [
    {'id': '3651051541103', 'name':'นางสาวจิดาภา แก้สกุล','score' : 50},
    {'id': '3651051541108', 'name':'นางสาวอาทิตยา ผงทอง','score' : 52},
    {'id': '3651051541120', 'name':'นายคมิก บัวทรัพย์','score' : 45},
    {'id': '3651051541121', 'name':'นางสาวณัฐญา อุดมมาก','score' : 50},
    {'id': '3651051541122', 'name':'นางสาววีรวรรณ เผ่าผาง','score' : 50},
  ];

  static int countItem = studentItems.length;
  static Function updateStudentItems = (){};
  static Function addStudentItems = (){};
 
 
 }