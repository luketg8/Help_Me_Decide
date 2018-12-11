class Idea{
  Idea(this.description, this.cost, this.numberOfPeople){
    this.favourited = false;
  }
  Idea.empty(){
    this.description = "";
    this.cost = 0.0;
    this.numberOfPeople = 1;
    this.favourited = false;
  }

  String description;
  double cost;
  int numberOfPeople;
  bool favourited;
}