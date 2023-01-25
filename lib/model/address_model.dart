class AddressModel {
  String? cep;
  String? city;
  String? district;
  String? address;
  String? uf;
  

  AddressModel(
      {this.cep,
      this.city,
      this.district,
      this.address,
      this.uf,
      });

  AddressModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    city = json['logradouro'];
    district = json['bairro'];
    address = json['localidade'];
    uf = json['uf'];
    
  }

  
}