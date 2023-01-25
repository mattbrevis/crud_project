class AddressClientModel {
  String? cep;
  String? city;
  String? district;
  String? address;
  String? uf;
  

  AddressClientModel(
      {this.cep,
      this.city,
      this.district,
      this.address,
      this.uf,
      });

  AddressClientModel.fromJson(Map<String, dynamic> json) {
    cep = json['cep'];
    city = json['logradouro'];
    district = json['bairro'];
    address = json['localidade'];
    uf = json['uf'];
  }
  
  toMap(){
    return {
      'cep' : cep,
      'city' : city,
      'district' : district,
      'address' : address,
      'uf' : uf,
    };
  }

  
}