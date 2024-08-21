abstract class UseCase<Type, Params> {
  Future<Type> call({Params params});

}



//Future finished and return Type