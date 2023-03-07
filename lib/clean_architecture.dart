// // Presentation layer
// class ShoppingCartController {
//   final ShoppingCartRepository _repository;

//   ShoppingCartController(this._repository);

//   Future<void> addToCart(Product product) async {
//     await _repository.addToCart(product);
//   }
// }

// class AuthController {
//   final UserRepository _repository;

//   AuthController(this._repository);

//   Future<void> login(String email, String password) async {
//     await _repository.login(email, password);
//   }
// }

// // Domain layer
// class ShoppingCart {
//   final List<Product> items;

//   ShoppingCart(this.items);
// }

// class User {
//   final String id;
//   final String email;
//   final String password;

//   User(this.id, this.email, this.password);
// }

// // Data layer
// abstract class ShoppingCartRepository {
//   Future<void> addToCart(Product product);
// }

// abstract class UserRepository {
//   Future<void> login(String email, String password);
// }

// class FakeShoppingCartRepository implements ShoppingCartRepository {
//   @override
//   Future<void> addToCart(Product product) {
//     // Implementation
//   }
// }

// class FakeUserRepository implements UserRepository {
//   @override
//   Future<void> login(String email, String password) {
//     // Implementation
//   }
// }

// // Dependency injection
// void main() {
//   final shoppingCartRepository = FakeShoppingCartRepository();
//   final userRepository = FakeUserRepository();

//   final shoppingCartController = ShoppingCartController(shoppingCartRepository);
//   final authController = AuthController(userRepository);
// }
