class Idea{
  Idea(this.description, this.cost, this.numberOfPeople);
  Idea.empty(){
    this.description = "";
    this.cost = 0.0;
    this.numberOfPeople = 1;
  }

  String description;
  double cost;
  int numberOfPeople;
}