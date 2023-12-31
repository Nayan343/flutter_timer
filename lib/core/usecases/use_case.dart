abstract class UseCase<Type, Params>{
  Stream<Type> call({Params params});
}