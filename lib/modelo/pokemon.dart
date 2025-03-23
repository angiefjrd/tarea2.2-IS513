class Pokemon{
  //atributos
  final int id;
  final String nombre;
  final String imagen;
  final String backImagen;
  final double altura;
  final double peso;
  final int experiencia;
  final List<String> tipos;
  final List<String> habilidades;

  //constructor
  Pokemon({
    required this.id, 
    required this.nombre, 
    required this.imagen, 
    required this.backImagen,
    required this.altura, 
    required this.peso, 
    required this.experiencia,
    required this.tipos, 
    required this.habilidades
    });

  //constructor json
  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      id: json['id'],
      nombre: json['name'],
      imagen: json['sprites']['front_default'], 
      backImagen: json['sprites']['back_default'] ?? json['sprites']['front_default'], 
      experiencia: json['base_experience'],
      altura: json['height'].toDouble(),
      peso: json['weight'].toDouble(),
      tipos: (json['types'] as List)
          .map((t) => t['type']['name'].toString())
          .toList(),
      habilidades: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'].toString())
          .toList(),
    );
  }
}