import 'package:e_commerce_app/presentation/auth_screens/register/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../../core/utils/constants/app_colors.dart';
import '../../../../../../../../../data/models/products/product_dm.dart';
import '../../../../../product_details/arguments/product_arguments.dart';
import '../../../../../product_details/view/product_details_view.dart';
import 'card_widgets/card_widgets.dart';

class ProductCard extends StatelessWidget {
  final ProductDM product;
  const ProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            ProductDetailsView.routeName,
            arguments: ProductCardArguments(
                id: product.id,
                price: product.priceAfterDiscount ?? product.price,
                images: product.images,
                title: product.title,
                ratingsAverage: product.ratingsAverage,
                imageUrl: product.imageCover,
                description: product.description,
                sold: product.sold,
                availableColors: product.availableColors),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardImage(image: product.imageCover),
              CardTitleDescription(text: product.title),
              CardTitleDescription(text: product.description),
              CardPrice(
                  price: product.priceAfterDiscount ?? product.price,
                  originalPrice:
                      product.priceAfterDiscount == null ? 0 : product.price),
              CardReviewStarAdd(rating: product.ratingsAverage),
            ],
          ),
        ),
      ),
    );
  }
}
