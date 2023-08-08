//Crear una Clase
class Band{
  String  id;
  String name;
  int votes;

  //Constructor de Clase
  Band({
    required this.id,
    required this.name,
    required this.votes
  });

  //Factory Constructor
  factory Band.froMap(Map<String,dynamic> obj) 
  =>Band(id: obj['id'], name: obj['name'], votes: obj['votes']);
}