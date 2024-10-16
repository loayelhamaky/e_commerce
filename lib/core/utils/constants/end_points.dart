abstract class EndPoints{
  static const String baseUrl = 'https://ecommerce.routemisr.com/';
  static const String login = '${baseUrl}api/v1/auth/signin';
  static const String register = '${baseUrl}api/v1/auth/signup';
  static const String categories = '${baseUrl}api/v1/categories';
  static const String products = '${baseUrl}api/v1/products';
  static const String wishList = '${baseUrl}api/v1/wishlist';
  static const String cart = '${baseUrl}api/v1/cart';
  static const String updateUserData = 'https://ecommerce.routemisr.com/api/v1/users/updateMe/';
}