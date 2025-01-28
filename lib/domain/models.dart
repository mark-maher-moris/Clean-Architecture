class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.currentIndex, this.numOfSlides, this.sliderObject);
}

// Login Models

class Customer {
  String id;
  String name;
  int numOfNotification;
  Customer(this.name, this.id, this.numOfNotification);
}

class Contacts {
  String email;
  String phone;
  Contacts(
    this.email,
    this.phone,
  );
}

class Authentication {
  Customer customer;
  Contacts contacts;
  Authentication(this.customer, this.contacts);
}
