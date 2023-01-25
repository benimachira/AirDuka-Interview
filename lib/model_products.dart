

class ModelProducts {
  dynamic? title;
  dynamic? price;
  dynamic? featured_image;
  dynamic? company;



  ModelProducts.fromapi(Map data) {
    this.title = data['title'];
    this.price = data['price'];
    this.featured_image =data['featured_image']['digital_ocean_url'];
    this.company =data['company']['name'];
  }

  ModelProducts();

}
