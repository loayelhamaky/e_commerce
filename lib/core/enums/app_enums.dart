enum BaseApiState {
  loading,
  success,
  failure,
  offline,
  online;
}

/// cart and wishlist almost have same ui with different logic
/// made enum to execute logic depending on it
enum ProductWidgetLocation { inCart, inWishList }
enum ProductCardLocation { home, categories }
