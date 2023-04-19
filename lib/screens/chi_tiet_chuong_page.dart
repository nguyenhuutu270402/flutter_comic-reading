import 'dart:async';

import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/common/utils/app_colors.dart';
import 'package:comic_reading/widgets/comment_sliding_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ChiTietChuongPage extends StatefulWidget {
  const ChiTietChuongPage({super.key, required this.id, required this.index});
  final int id;
  final int index;

  @override
  State<ChiTietChuongPage> createState() => _ChiTietChuongPageState();
}

class _ChiTietChuongPageState extends State<ChiTietChuongPage> {
  late final ScrollController _scrollController;
  bool _showBoxPosition = false;
  Timer? _timer;

  List<Map<String, dynamic>> listImage = [
    {
      "id": 296,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320023_001.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=ndUC9WCTwmStRS5NWQUTEBxXvrv57bnPkmka92JB5toyS0prmxQiGLssCmuifzk6xeewYOF1069J6mQC8JlGysWg0JCMuxPFaEo2vpuDOPyaOeR%2FnNZG8CfMoKf1M4wy6mftwKvZg2RnBLkXAh30T84TSi7M3%2BELUsQdaBAjSiApW%2FIpPxH96SOhafEY0p7Rt90k0oqFYIWsOGGuBjtxjZKBhne1eow2GQKz8b7L4wyZra0K1S%2Bj2fEmMXsqpGWXhz%2FYI43aq9tEW3MBrQ5%2Fo5acOuO9qpv3Qojp0hSbaARXbEibptLOmBcPMoNTMCy0X5oXIfNJNQG7yTIOoZYP5g%3D%3D",
      "idchuong": 1
    },
    {
      "id": 297,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320025_002.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=DUnPAQZLcvuEiALR0l43S8kzvsRWlRb2Q0uTx0cmOFECevMbDDSwtoZ9n2cVQwjwH2KJxSelL%2FWNb5y32M%2BJxi6wH4De5DYVAk931gGWKh0AUz9lq5O97LuC1HZqgxcYblxwPSYcJyEay1VzP4uZNj1y5voHzXADZs4IrOe6d%2Fqee4sN9q6BjYdcjH4mEnKjt0aEvPITncQq6r8fg6pBVKMlJfYwRqIe8PI0yCxGoix4IxXtWSaBT7bYHf42vd4mZqxSkqw2h92BK4vuBmVJyyBfsSMB99XHkrPBDaDgxGMpQuXaqmmxlLpVTHBHzePwGcy7f9h4K5ARrlQicRrZTw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 298,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320112_003.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=pF7ORCnanMQDIYw50yScRPVVgPkizOh8yULwZAXRsDX4mr2satBufcPUhNUSxo%2BEQpX3nXDrApkH9Z8hF%2BkOTQBJZ3CO6E2Xg%2F%2FyfGu4g%2Fky7irhkLFL6ymoW%2B2WgThdOPQYFYacAyjm4hR8nWDR%2Fc5gkW0ArywwyN78fAHK6grbmIopJidNHZPIXHIQLe7Rf3fB3JY8tFpecZB3AKh4PJYxCvoi0IwQF%2FliYve2piiOW8trT1RSn2buHfpDRVcaOlBtMKKy%2Fej%2BucQm5dns9%2B2EDodCbcFyd7COR1hFH6HvaTqJZvSDCMedh6Q4Ey9Wh89m9zFCm1pNOQ4sPNwdBA%3D%3D",
      "idchuong": 1
    },
    {
      "id": 299,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320113_004.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=eWKb0NDWvvIa3R0SyV4G2x3SPr8nSHxlRseAJCiZZzxOIh%2BduyJmzpcu41J1gQOMooxiFO9xd8mE%2BcFH5ZCGweGOZpDQ33F5CU8i1NSliU4jh80Aq6EJdfcrcTr%2B%2BZZ%2Fg%2BJXBc6zU4NYL9VNCFoHrHA%2BaVgfBOCZCO6a%2FfhKiBuD3pjdiACcA5u2uDATLah%2BMw%2B8JGsJdO6jxuI5ruLPTHMjj3FIp7WDrGWj2rAuLNKm1%2F2xGfbsQVhDrvGm4M42doqDZPDdu%2BN7vrw0fn1OLXkbERI4imKPsq0pl8kwc48csJC5iNyLkcaL%2Fv9Wxtkk030AZlxXdTFkySrQQBFuRw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 300,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320114_005.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=IEDVwLgvJ7B%2FrpFOTGV8zQ2qsRFh6CapL%2FDFmyYcHodGr4bGST0Gkj%2BhGgQbA7bQnJwAW7zsJtJx63wAr9qYcYogB2bgKS0gm9qVjJg8hcZwjtVcwT8jLzVQe8ueJsitka00rneU4s2XR3pZEfkc0DLJcuC0HhrBPgonmqvwzIJqSneiHKbNkq%2BzOEeFNnKOvIFVgO1a52nvl8LfVraXSf3k3ynuabPcBs8IsWWpexsV2fLEVoGCKzk6ZCcy45g8fmO8VK8R4rvJPU6E%2Frhn%2FbQTI79ksCOD1zw4NAMzxBXjSEuwloZJcSpFJPirzxu3Q4jmcCZF333tsqhrZH6FjQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 301,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320115_006.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=U9HQuaImIk9gKnLenlRWRWct66e4dNBsj89xSN0ATKpkjei55iGDygc%2FY%2BVCLlsX98TnRH%2FZd%2BsuLyp7elZH0bFvM6i4L19YhVz%2FAtPSVQMwLxRL1Ipk%2BUobFAGmyugrbHCZQGfFq7CC1gbGS6TapM6CvwBPPGYT8u2NrPyjGYLHRwqqZzVP5lusH9xcilxxuX5btsc3HKLFqqrAVHdg%2FNMrKbjOlODmyLPyLC0do7u86Fzif2W6XW3064zz1TEz9RWowoVqh1j41XA9SzbHubTuK7FciWw4oOwIWknM7IVITiKcLZw0%2FVCdQzUImwKgnB9x%2B5JHAMXpRnMWC94T4A%3D%3D",
      "idchuong": 1
    },
    {
      "id": 302,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320119_007.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=Z1McDpo%2FdIQ9dNmYij%2Fr2VfbwdyEILl68l0l9Ggbd6aCjkgx3RC9wUwXI64AGCrkcuPrhN3e3PO28mBffObnm9794%2BfcOggPv7T4KIwiWX3ZruKHWMpgf2fFApuqt3H7qqx21mHlPnz%2B4mMVeMVupW0%2FWIlX6AvJHgI88UO%2FNrC4bkcRsNkrxKU2GNkju5nqMbMGY2m%2BITy4kOjgGjd80qxGMzbBt5FirBGvAE4FGeSlkCCHspLikrX5D7CFoBb7p7RAm%2BdkiGh%2B4%2F%2FAykfitop%2FQJtdKh5EOAMhnShL4WxnjWfdGPf%2FwWle3auCho8FCTeNZpv0T3wyWawhnuk1QA%3D%3D",
      "idchuong": 1
    },
    {
      "id": 303,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320120_008.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=C%2B%2BRnAsTATfbnL1e0%2Fmwy%2BC2I0JVJzPhgKJd7wtve7VA7oP38rZBarMMIHTmHwoO9UYg6Q8TnostJn8VTvUZPSX9N8t55ZQ%2FIMrGlBKMa2JskL3up%2BRk%2BW39FhXR2Z5drJV%2B%2BbV7CbCUj9mEfRhpE8%2BTseMKFY0g%2FWj0ZLyqNQnT%2FkN3gI4wDiMRvXj6e%2F48ci9VMgSLWz40t571t86Gw2KGDkAUc9LHIAveOyPVXbFzcJFEUaRURh52CQZ01ovxvsoVqP7EYKpsP7UAkFI%2FL1xczEEAa3LBd5XBY1hRQvvEAkKWpBkpPBYYSCab5HfNC2xCRcFnnzA6whTfYB0fHQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 304,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320121_009.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=c%2F5Ob66f8zopMzy1vdk3i1MVzGtdTFGEEjXpzM4MFmdW49G709fF8yCtafLzhzj8L2So6pcVqjdXCHEXWwFuEP6mNmbqpR4%2BPhuFqAQPQdcBHl3PFjHot91yr7djqK%2FAmgfgAFkBepnCVyUswSs%2B9Szy%2BNfyfjrNkamewR57jpecteIGL9deEnI3e4lXLCT4qJOjr1Jd5Pd0ghCPBmF19aJlYAjp8c8k4ViOI34jE%2Fh%2BH76PGqdbFyJiWL5DVM55m0WW3BtZeXxnFLrz%2BSs8zfgLX3sNeT42bwo7a5zxYzAbv1Gu72soQDAByWMWbcP9c5EWBLwrMRXjpafvPK%2Fpow%3D%3D",
      "idchuong": 1
    },
    {
      "id": 305,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320122_010.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=DD0TI%2FGWHgpL%2FVQhpj5bkpmBUXIH3Va65Kkj1rGjxRoG5yZ33LTEMiLH2QRIhrLt1d5NrA5GBNaAzTL%2FSOEB69c5RPekRRTRbRvSyDqjgtB2Lo5zbGa0KWUMPa8BaFp67EKWO%2BfCzamilgaCh%2FarkR1ZeVK9Gu%2FaUKMRK0wJo%2BdJ%2BM34%2Fu3E6C3tx4MBUGIIpPd%2BKPlpQUttpjY4nOelxeG8kB8nQNZDfNm58lfTmcrlsboOlVpMUznLhUuw6w9i6C7tjMVFmkC%2BgUsaiAiCNnp0vXdlGtXVY7T6IuVTZe5G1Rd68QL8dAp2BRISeaQybUtqG3LUy6SEuhsoSNAdvQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 306,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320123_011.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=hspSbpRG50%2BWMpATfFDOZ%2Fs3haksdql70RWBPWrvtlCburcKeaoAptX2pzKY%2BKiDX%2Fpwfnz5EEOLv5UhzJllVVI686trXzrul3cbq5wZTnX6pBag3SVQ2C6B%2BeQb9VkH%2BoqEt5Zm0bEXBB2OGa0%2BofnEKCfeb1kNd6DuW9Pan%2BPtLMiPA9WXxeGK%2FZpeMenwOL6sIAgPst9G6LhoPWe8lBakRgks87tnuZ8P7dE1yAWbu1Vnrrm4R2Ve9UBC33wehLnUIimrDxTitff4ipr%2FiVsJ1LF7WZRo9fjSrA6kAPP5iec9mjFW09p7SXJzypnPrjXt12%2FvfhGYaXcBxZ4j9w%3D%3D",
      "idchuong": 1
    },
    {
      "id": 307,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320123_012.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=BB5KDywx0ah%2BWv00hzaQmAbTvOnZJKmfbvb33NAfE41X0iRbbHc6u9STs6ipK3VAnRJZonzniT2EydmXjODbbTByYuGMeZb%2FR4Zv5UcRWApE2UakeDtJiSKSCHrPZAil0fYINy8FaP3%2Bo3ZM9%2FbcuxYiFXcFTYjpOmVpXsxgHL0MrQFjFNahV150yaxfnKS7X%2B56XROY0QPbBOxAYB6pyrlCrKh%2B6p77dQwgsH5S9r6Sx5wtR%2BqWbVgVpfEYiUJHIWHrCCG6OrCF%2FOw4Drkn5OiY6YWen816J35HEV6djqhr4zsPFCMgHbWKyviRz0M%2FFD0nI%2FwPkAqGLPiM8B2UBQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 308,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320126_013.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=WqTfvSVigITHZdtJ9KzQUOiCewWwyxsLY72eJF4q5NpC41ABIP%2BUc1MMYUKR6oOmS8lH6kD%2FSrihIue0I1OdfOCQbkKil6Y5crq2FHUVttLS6tfsTBzKMlS2uO1sVb%2FHMY58QB2AbpBz5gdNk7asAmfKbuy3Drwh4OpHlNoavGX8hJ%2FZW2EXfigj3ElKkfSVtDgkjHEgCyoqKxCCwqfH3nRGeGuEVZKgh5IhXoHvOTX4y23jxru8BB4f2pdjm9lSsRa7mY1HSQtk%2Be9UCkc0oneAmUxLuMtRuD7gQUgbT7Ui5eRIc%2BBH5pcdRMyOjCuUKsctBCNbR9FYBrvAgs6lSg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 309,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320126_014.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=ASGXlTifmcU9SwHMJyRW8dOS5a2gVuA4MuUgnijC%2F%2BWlLpVoQBfegjKuBVMLx2Nb9eHSGzLq%2F19tgSAxmS52VJ9yHPhTcqEoedDnfkIcNn2Rt65oIG2ASgGZ0f6SwiZ7kW0pOw3gHD3izS6d8QikH%2BHgQePHJ0ANfpgp%2BPnJ5dEcu85SN5S5L8iLgh4oVQIWai%2FUz%2BRGFj%2F86bKAGr%2B%2FpaKqfto6mMApmS3zlrR3JszegXr3Uwz6ufsLwwxXxerDceJTdcipQ6iLE1%2BLWLhyFKhqwreDDuvehOUnekiB1GZ8tcVAxwVjDvJSrZEz5i8BESutKy%2BRxpZbjh8FgrXDCg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 310,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320213_015.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=C8W6n7zWFnE5chCuDllTkvmH0Aik4Y5vVHUbKISOhQ5A74mNkYZPtAIPxdxEStwGbQGeXm6nTayS2UcBBwrqBOkcuJZzH28TI1gmaUsWY57EZ9VQakD4gulU5pYheClLw4PcZI5MW4bQyHo6KJcaMdGokiJLL6O6N7QCBeb8nBnxcdbngsxAso63udnnzL1WhF7vjz09VNxKDDIdvzqtwqdU8%2BSRmovFb4BQz5RwP8r1m9CGr95%2FJJpRhfJ9%2FcMMH1wxLf2LIrl3uhmG46YzjZ1cmOOgd2yL98y1aMP8kHW0LQ%2Bkwr8WpW1LCBtggfqUzkiBWDFY%2Fm1ZOdBk2GI5Hg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 311,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320215_016.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=VkxNJgKyayysBLJ4vbNWwn2npf8dkPZHFRtmY55sjpxHDEiHoUenCE6BKJOLsXdg6z20%2BOD1P1mMHgi%2FunMJGjh6gWx%2FBb9r3phxCBGhb8ZlzlQljUGoIXqb%2BtIdZZccHmT3agSH5Z%2FvNUHJKrQZ9OYibFGCuI5OfN9Wg6oS6oHOwlK2bRUDvdGFNUxTR8TrR9%2FdddIeDi7nCHYGt4sWZZfGkacP5N9j%2BqBVoXfaFYYqI%2BvKXUu3ivdBoLG%2FOUOA9PP%2BR90pfSSF2g2C8UHdGRtif4mRrJBKtMP%2F2CUgEc96TO5xWbdUx8DSptnt87abgpUJJ3ATtuF2oRfHdIV8rQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 312,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320217_017.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=J3u0oydZnUGmMvGSpGInUFAHRRCZUuyUIa7Bu%2Fe5GYAwf%2BtufwL%2FhJbHbF1ZbLiXQadTCBB%2FJmFmsG9PRLHX2vsHM42U%2FLVRPgsva14SiipbNIlhxkTHr7eyfDyqFiAUcDnmwWOjgOtQIbYtUEH4gwLf4S3tyTEI5OF5WpcvbFtbAOzVXqF%2F%2BYBET8GlC%2Bo1JMBD0hlHTrnwwqeJVjd1mCnEL3xz0Dp2nedCdrFgdQdA7kvTDVTSnr1fPUNqM%2BIDWFhN8uZrxEs0sLelUkJ6A7UTtkcqm%2FgDObVDF8kwpxtiECwexyK4qq2Y7jXWZchHkxBotfPhX0T464v6zK6XwA%3D%3D",
      "idchuong": 1
    },
    {
      "id": 313,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320218_018.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=BnsOFaFrhXVze2qujbiyL6UgW8iNvihFk9FVGv8TAXj8tWrqqsq8PSKT821AXKTnPtG%2FSFMNcxHSecJdUmGReOG2%2FIMGgkog0Dy%2BjoH3nS41LqX8u%2B4AcIQKa87c8tRQSdQgbWJ%2F1AU9DkfXwIfiuNUtev2KLUQACyMPCvZtKpzAXeOpZTx5GAnM%2FPUmMNfX80FemY%2BxYcIkARVIOlK1%2F7aWI5xDcD3ysp3mRNbSZebRmrH2VxE%2BkrZuZUn7R1Q2hfVEpkq3NIYyq1MZQvzK%2FIgebYy6W2G8chJxS%2Fk4QqCuenQNnE%2B5yyIz3kNVlcBInxpe2n9j4Tpmu6HwvJqUUw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 314,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320218_019.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=EeWSbyYSwZQJFsG5ChRwWofKpxKma15qyrViTohcFyR2EeqMKqTcMa3zFhIKbzH5BSXGjJsOwGhnlzHcMDOIYCBSIgjKIh3aKrO%2FHddEmobAQeCGA7uncHxjsbtU6AVz0EnWLyzMj6qfzguemufuouIFokqcXeOFmhfDik2qQca4lFPEOJLuC4yNKmdnoKD%2BbkVCbcw7tQhLCpafFWvu1x%2BX7sZVZFANHJoNHfm2Wonc5QGnqTeR7%2BMFDJPvz0ZRPZAHGhYvpu%2F5F0BbcDMI25aHTcGKDdHSx22LyJh2giqJDPqbu0rhP0gSiRL1iswGqSN4zwAFpmOa%2FGkWBO0H4A%3D%3D",
      "idchuong": 1
    },
    {
      "id": 315,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320221_020.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=AaWHSmfklG5o2gecPSM%2FrQhmPmSPn7NF6qUTSaEKWS5hqLQTnptky6pcmopImujmTzwxNJU54AwVZMh6ZHySxbdTOJXZJQ5HKfFBE2UmTyl7S1WFlJyNeACrGjFa9Cw2aqhcf%2FrP0CW%2FUR%2BAFrhaV75DJoYWiLG1xw5NCuUrhpxad9XQRp5OunRcplaN2A0rcbrr3peU78kyEZ0f9vwjYS4wMgquD5QJg1l0thYFkiCmBJr7nohn4iL0IYE94gZ5rYoR%2FWnwFVYVoKRk4mI4FV7GmCZZIAN5e%2Bm2XGuS%2FOAkdubfZiw9y0RMjqvso47%2B4YoUQq4rZjtKt%2BJg7TdskQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 316,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320222_021.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=Gk%2BxNFI4vzDw84GZ3jcaiXHuotcDDQL02%2FK83evmb6brlv1hnetIL9S3XDdeoPVmPJfYnSbRuhldhm6a834HOvKxocm60l05ZF4N4CngfnUK6y0OKsaKk1HfmEv%2BvobnYJtjnyhCKMlwhApRGYZoIvPOqV2sSlcLlKMK%2BcUzOA8SB5hTStXUHWg2AWRDl%2BmGPYSPyfMAVOErwj7lBP4f%2BsgTkwGx8PLyZ9iyZcvHwhxfCCTMjuPLkl2DCoaMqoGmvuKjYpRHz9IVKFR%2Fddse%2FeqHBTP1pBGwi3%2FyB8ky44j9rSaLfspD%2FoFNrJxs4dqY1ZUyQYBYxxZGmlWl%2B%2BZebQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 317,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320223_022.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=RXzI7jUu7DN%2FVRxdC5LqEHR%2FEGO72uj%2BfeC%2BN8GYI97rwAxPTWY4BhQPXCa8iQMbTNSYNx8AtsibipwsGb8r2J%2B8GlHpGF0xHMRfi52O7RvYOVlcxNgoNbEt4LZd%2FJa00UNHzFAudGKP%2BbEWSmb4euNHZhl8ukVJiFSCjXMYRSplncutKmOWajRlkgkKNiCPXfPT6BrdHDWeHRli2AJfcUyiViEzpotwWAjUgMd8ZxwyUHpseqW7X%2F2NU%2BodJ%2B095d6yE%2ByxhiITtBdl7uNrCZlw6N9Sr5i15Y1un6kQ7GXC4qjKAQ4IRCXwrEWQpXczZUnGbXTLgH3Xecwkl%2FSOVw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 318,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320224_023.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=jHnBoXy%2BlYKckeZyUWa%2BOVhbIOgGS8DXHELF9wBi%2BEa2FYI%2F1tfvwzmkGjz4rqgmW0KNKpYfpuBcH7ZitWhFI0fZU0wyM3QxgH6cJyhMHG8eDDlzMQ8JyTe2000byXvcdseoG%2BlmGsBflwW1IcRn82wCLCLwWQvTU8W9Hhc9XcQ7J32iHer38S8JwX4GfSAhZh7WcsC5jhvkRdHQVvwbObdYzfcMBXT1OMV9YcKlbmqPSFz3XzSCXle0VrpyYTFaDrEiPanN5EzZAMG2R8i42b0MKmPbAihJx5iydbN7qiqpG45yGz9Zyq4dA2jO87jSAjS%2F9vOqhYhGxfkkp11CgA%3D%3D",
      "idchuong": 1
    },
    {
      "id": 319,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320225_024.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=T5yDtSOn2abmZ5EViz8fl9GB3xL%2FdkBJQj7D8g7y0lBcc6i0uyVHYwFmSkgW9%2FkxOz4lw%2FhnA6R%2FbIY88evcQYYMTdt2ldzzBzXmtMUjEVKkGr04uKWBCgspvQuBjj%2Bynq96HiGHMvpiYlbTBkddz6F0uruk5PKMA1yV0%2Fi5jDpp8s6DGQgGr%2B1e6wgLwV1IZGqvppC14hYADs6FmLhagQWV8yeFZFMvuR1CAmqxWT1N7mM94tNQwopV%2B%2FCqmpsI6pR7yAbpd1m8wtYK0CN7zCPw%2Fq4Tu64lKXvQY37I%2F7Vy8gWX38DvjKA4QfzLbIcBGn9hErHA%2FzrL9pIvB5qXdw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 320,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320225_025.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=gJPPi%2BUHuiuPxSOwDOpP%2F37OYoPijVq9es1YUiy5b6a8otHAkkpdNSbLr0ILzvKiHUJ3peFdUJehpOOMxx%2Fnf8QnpCcL9CHlbPdLoRPmSR7csk5mdboLlx49ok7ycdkehAeqs0zuFqpc8ui9uFYpU5dFcnKSculJmF0qEO2ISoXEbB%2F80JErJObcy2ioSSYrhiGsHEHSX1FmgqsQQKaYzGsW4AkvWfooK1778DHHs%2FR6I5V047FoAGlUioqbqyO2GBb5%2Fjov4ICQAuB%2B6PD%2BomLbcL73%2BomgaD1BTjWGlvHGiqyuuGoQonbCus1fwoZu%2Bq%2Be8Q5hMnqh9Fv35pxQqg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 321,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320226_026.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=lhJKPukg578mKySdgihpV91LluMw%2BUhRZLhnaN2Gaea%2BqR6a4DM5gwuYbPOLt5MCIJ6iKNtBs%2BHS1V7tSE23v8xPv37TK6iE3pF4WLAFluNTiHzzVotMMIg0UfVixnsGjTfMwoZLnJlvZnCV7yip6iLC2hvYYuytxiM5yAAi7vFXYE8aeu6kKNs6ptdrM1Dx6NGNQHnqfHGIV7FArAjT4TvNxszUVCSF%2BeoGS4iQQPRbIFw9fK3iZQEtWWKsW%2Bxpa57Mrs1hNNnavSgLn%2B9nQ%2Bx1QXFAm3kksXACPkREukN%2FBPoVfqfMLtmtq7ZkkYSwp6PYIwKzrAgpLJ%2FHwL%2F4DA%3D%3D",
      "idchuong": 1
    },
    {
      "id": 322,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320226_027.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=XY3CqED5o94CHAaIGZY1a0dohCNip%2BHmUtblkI2%2B4q4I9SOBhBMCkz1hkSSLqtp8sQr7sB9EJXqe3BC58ooP9ZzxkuLQa3XC%2FijzLw2mcWBEBvl2MCu3mvRzRqyNPp%2FS4%2BH%2BzVj8ctJVt3AUvbwSzzEDvRmSzRDK3e38zLJvnxsuoyY9N8stKlq%2B2q1vf5Tjfl9fV4RfsOHLDUs5vLMGXbve4bYR70Fun%2BM59avmAZTVC1DTdBwOfg16RyIlan7OUOABSYiE7J3bfn5E3GutohIif7XxUnGQv%2B60fVywUaD4%2FZjbSlAb7XJTkHDVxU5k5IinKotD9vhkxkGcFz%2BMgQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 323,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320312_028.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=Gj1iIMB6hRwcrqFUpEKzoi%2B1rumaYpgGCwonA7KLc45T8LhHHrsQWYTCwWje4e2rP7WNkTOeKtrGiFM8346HUgeaExTzRQAWe%2BrdxyviLSHzROUUYDZmN1MX2ZpGxriPl3%2Bha8n%2BWNq%2FGcVCfIjVEnZndNUJ39A81OMYGtHSJL1Ja%2BdfLBG95%2F82UwoCqlNyB1ahx1fFoY9o6t%2FRG0NiCjFMzB0erRRAVIR8Zxgxh0Ji4Dg5pjhjcPgbubKJg744G4tBQGcYHDBMt6b7tTGHqca5Sva7cBidvL1tufwrNyN1FrINqTRXa4Rz0Etv3Y4fO8JzouH1t%2FssvA6Ad72YEg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 324,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320313_029.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=f%2BO4gFVoKMIykRUZ280L8GaDe%2Fo8aLwzC%2FpkcbwuEo2hhHW9T2rVq8UEEAr8hxOF1NTghfm1BJyWWgcyq5xInlMz0BGC4dj8JPC6uLqxJePjvdFnQf3pzNyjNr9Tc%2Fi94OfI1tSwAkkuJWcyyvKzr%2FZFg0rH%2B9rroLjWSDDjq1L%2B8XOUEUdWPl3J3v7p5GkOUQEzIBIQVvv6tkIySvV7vjO1nPCY%2BWhDPg3bvV63Bydi3PVd3DqXuH9NS%2Bz7NlhHz95k5Vl0XDQbSJOJPLuojd8%2FvO933L%2BRBH%2BPBsW%2BSrVKb8H0Y%2BuDrqS10dtNxABJfEZapX1HGDSodLyjVfeECQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 325,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320314_030.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=FSgr7%2BjuI5hrEO9PbXka0MNB4%2FTgNPgwOkhzK%2B1JB2xBDeo18XPoWQ%2BVvnWUmgQ%2FY1LJyfgT1LamIPJQxIXRs6nmAH%2BI6Ixr0HZEThS8X0P91ePLWUQr%2BLFLbvQYFlTKx29GOJpG7%2BaQUxm04tGmLaVZfK0SMb5oImMtgko1hz4ORSy4DmKAnpOzmV2cGewmUdCfIYahRmAzRRl7msAz441WzNOfO%2FVcYbOG3%2FKsxaRnnxalwJZtmKQabtPRju2WyFX3oYGOTwSCjaikcu3kABw512hh7sctUnRK%2BIyStKvKH8amMAAt4WHz5DSUzMIh0M%2FfCLFyPaBlw80BW0LLkg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 326,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320317_031.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=ERdHR%2FsgnCGCVpemEPExiIwpyW6fl35ND%2BnZ44JJcmco4W21g9OduHY05pHKkz4NwRC2iPlTczqoubFACZ%2BIlTSBteUecjJNDYfIGoe6gdGAZxg9Ih7ZxgmPRjpf2QgOo%2BgFd2po27T7BosQERoxsipKSQixqM2gRfi2Ic7gmLCJh%2F%2Ftye8IwgfQrLrPH8Yv38zRsLH%2Fd%2F32MxEd%2ByG4Rj1AES%2BfMejZlXw2AZUQjUTmhTrezN%2F3A%2BgaYwEESGISkLE2jYryo8%2BY7uYMUgYNcp2Q9Lz0h9WbhVdBtfn8P8TsebKZNLHXRgOM5aFU98XNAfqL9RoVtLi%2Blkme7iJFAw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 327,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320318_032.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=AauNcNXNK2OFrVbvQ5mt%2BR4ERNc2oH9pmgJOdZBAWCrKYI9bviiOUh%2BXlC6jttAdISerVm9EfB4A71FwKk2KCirbPTtQIllSvJx3CLM5snNWC6mn4pNY0En2haKwPEzXwmMF%2BKr7S18otXHZnh2ZTDzJy6YeiAvK8ypbXxDKKfcTNPW0WHzF6sR7FD9xsSHptOqNeJ4izurdvieGJDiisYbtLUBORw%2Bn3aIrK26WhhEQoLsep%2FQxIPwn%2BLKY%2FiL6Z0EtOKFhsupOsz35kUtosgEvf8kEVqK7aGl7u0EMk5MAAl4O%2BRMiN%2BS3b1yAi6xtImItiDf51ofjG2h0rs%2Fw4g%3D%3D",
      "idchuong": 1
    },
    {
      "id": 328,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320319_033.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=Nl65dFfmX0PQh7W%2Fu%2BuCbzC8tVsmnq25ZdTjE7eYLNa4BYz9vLe3ZwdemapnNJSLTFCyQAuBJez4ZoEJvcsjeqOtHO8YwGR2jOToIkU9fHUNl8%2BxQ1DZr9QUcPy28IsH8d%2FbJ7Ea0WQjGw5o0bdhFRjvENkI0uBNazvoOh1h%2FoJoOL1Sk6qBDB9F%2BCbFaqe89MvqD1UtoQSk%2Bbv2r680XC0K4IikErKFb9mAtjkVk9Ly0AigDrfe%2FtKkjJgB7O8Zsssb1GEm%2FgnWKhBoO1xDwJLnKgUEEKAghZGQkG69ZQtU8K8tyYJm9pFfWt%2F4Bu696ZBP5xX6d1RlW9uTCIqcbg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 329,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320320_034.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=R80MEvsa%2FjEX9tflAbHmjrknBjaxhUdp88utr608TpUd%2Fhi7ZAc6ZKWihQ68KYSbuoz%2BbQCbV%2FSXZMk34Kb57NIEEP94mh1X2hSFyofwt6d5vmBDhAZr1uAK2D40IPhUjJqZYozkf8K5NHh0F3x7VRTGHbsgxYc6f8%2FYL%2BB6mSL6VGYCiwkUaTmooqB%2F3OkajeTHASg7ey%2FJGtWG8usQPw2QFyxrKL9037Z3ejZcI%2FRcxDfZlhcXu1oAHYPyQBA8jbJhVD%2BtyTrIcW2%2Bf8VItZllHvLqFDS2GOz9zIQnCkqu5vy63plqWa3YDtEP2HTkmIDNqnOkWP2ehMlKWzXIEQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 330,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320321_035.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=mbgnjIeY16ILrZ76fERsGDs9rnyTEBnOU12VhRDRbeMGBMnU%2BPTiG03hphpILkv1RUdX9BjPd3GPc7ko0gfe1iifXwFtaoYYTVOsfDTVynZsyRq21BCWQjEn%2FgYA2GThkPg6V6dpvIwkSBFuXtMgh0HEdj6I9pV3yk4oR7SNxIiJrp2yuQMHC6P4CnY%2B7sdXy1TM7myMSWYBM8%2FuGZdeIr4V8It3ItdT%2BhWK4Un1IUvvon0YqQQwolE2L3YFVPnhl9rmL2tmEuaKau2vqG%2FZ7FRHWEoDozQIOKuhpuSSHwCN1HBZH6AIhmIafHevJU55uMB7yoQ2NhwSLtd%2BEwLzVw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 331,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320412_036.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=LlN9nCtuI51hxel81fbhCdNd85iEifHjRxytP7I4S8K55XRxmVe2Z5jEhwlirVHD04alWX1qVdz%2BcVgASTLvKF2bNNh4s9NFQ%2BXi6CxV0180MK%2Boxs8lHt2ZSrQ4jS%2BAQ63zo1%2FbLjShH3F%2BCk5cxC9%2FaMpZSShP5kF9L5%2BNBO4Si9GLu0uuLeOu5QnhyRI%2FxsSKgIH3W0HKUHmcbbU6YT3Nn%2BgtHKA7isoHG8P8Dd3rV7OXjSzvYbesJMVkyAFvDeaXuxkvO%2BQ9QO2RYUR%2F%2F%2B0kRxdqxGANp8XGDpgKqi7H1gVoiFXGCXC7zCR%2BkUS7bk2nIjgAw2Jl6gABsQdMCQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 332,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320414_037.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=So2k%2BLNWfk72UYT%2FwnBdu2qb9CmykbRz1mp10T%2FEatoZXZbEV%2FuGDBdn7Do3gM8D9BJarkkyV2PaDyMVGbgIly7WYymhp7U2boG0eQYIO%2FBRPruXRr4qFqsYrlcnBSh6DO1qdX2vahsGYlj6NLABege9Tk8taGGfo8dK0%2Fa1v0UEmIjw4PeFMwHKzO79y%2BTKZbl1du3qnxrri%2BmB9HDgJMz49%2Furao6lxYWMHBm%2FprfZYmo5pna7GkYBXX%2BHL8hsDz%2BgVSBXDmBfLmemG94yP3lkKLedtQWvYVFttYjYqp8WgP%2FIyFlOWvVhCFex01q1lOpajXzimIDvgkcaoP1S5g%3D%3D",
      "idchuong": 1
    },
    {
      "id": 333,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320415_038.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=IDWoYwqOzYF%2FiQZQyFdjCMkZP80eqG6Kc0gN%2F5ktmG0wkraQEHO6Cr%2FGWW3mdeU2EFq8L3pnqInrYuEB%2Boo5Q%2B0K1ahH8MgNvMSD1D0yuMP%2FBESoZqWnT3idq76ck5UeJQ%2FvHQYgTqr9RBH8YG683o1Pb1Hu1JfXCUQnHLf3ZWkRVwX71jHZyGaU3tSVsQ463tnQ60PVD6pzrEjDzWxRFzZS8%2BjVB8gSo69WzZjt0J0GQdQ0cctjfgpH6CefXtUmzOOF2%2BXHQ0Y%2FFsuceqHEv5Sl71n5CDyUxICG8zfdQ59c9E4ANhYCkLQATNicTEK2kxIannwM2e0xKs5D3FLasw%3D%3D",
      "idchuong": 1
    },
    {
      "id": 334,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320416_039.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=mzjGUbgWZe8rP9KdNWaiTWJXJQ4V467VjiUkZLkaV7pj0WE37SF21f2kC1ApjQxYuXxxDjwvfYNbCfSS5vpEe3cI1Fw%2B%2BS71u2xJSqHw4G%2Bpgr2g%2BzQo7JsqabFpSrg3vcgfVR7KVlwbtgYTrZIomM%2F7q4%2BCb644hJpQsamm9tyJz01%2BGEqEhr5KRQ5MyeVJ7EPHIvay9136wPrCO4qSiqNZsT35ozZgjq3JEywH6AM7by5CkqtFP3KH%2Fon2J2ho4V26cu59pbh%2FvHmH4qkg9TuxGWhtX8famcSQfO9RncFJE4rb04O2Q8aj1UXhQwqJ8o%2F4ngPeJ2HFsDMwSKL1oQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 335,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320419_040.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=DsNJYbCkqwD%2FCwkvJkyxTlxP85zwt6gPP6SkIoFhm3P5s8mr0oKZ8%2FhwcHI2OoU140qCjNX4dXMtGu0ZigBvarTeD0RsZpbGSD8S7ntJuFgwzt4f6vyAHxX6RGBIsefEbF59ZhzgTTkhfy5s%2FFipTeSsIbqpPtt711vyIqzLtkWsxIzeXyHxA3FHAeEjA%2F8HjdmIXq74QoBXxsBZtFDnRdeOE9ITVy9j7j4U4VCUPb%2F2r9TKl7oaO57xA1b9OGj1K6jbOPJgWgwBIW0Tc01ovRacsTo0qfoJLGyJQ5TlVrGZxmxQ1RDjSahmjQOY2%2B7gtdva9C5gmTpTomhn6uy9VQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 336,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320420_041.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=YMwvXeV9Y7546dTiRVlVeLNzujwl2YH8WO2O1YjSIDt65PcViNtEIOD8ozh0QcoIEbl4izog%2BYy%2BlKX%2FHbIgjSuJgu3yNokk7Sc4UBXgzrDl%2B0PDaHL8kAAQsu43fkUGiaRHbQJLwkrp8Dl%2F%2BRJnFjNxLumIagQ0gdU9lf3IipQAinuMEuDQ0Sa4lCHRavzrl5zhKFhkyiSYDQzckQEAbE%2FjfZyxxWSNt8MOPkvpmRofo5p9TVRm5sonSgSMly158EpIO2xe3g8xvbqdG8GdvJrgmkFFYuvGCQJcUClCYT%2B2uGdxx2YTAkhBMNmL7mErB8jetNk34VQef%2FzCF7FxLQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 337,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320421_042.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=CVr900dl%2FoDDLX4QSixURHQwxRz5qnYEEo9GPz0VX%2FFvXPzcn7hHqQym%2BD%2F0kUli1QPmo4DpP96d8PNq3bPTPpqt5ClM13czdsWRek33Mtfga0RkjVlBHfT2geNSlReaT2%2BmwKDP0kIqU9NcDY%2FDHlmfyfVovtyCP9sMseWjPWGfZU%2FyT6sclyLa4zAAvLqdkXOdtCOw1sy5fmGbhzpkA4otHwzOKcbYsf80KoZ6aM5stw%2FIuAoTV8DUQbl7Ibun89P0bKQq7ByuYROEmTlXRn9scG0%2FDbbV0P6S2UQklVuEGcH7l19AUtu6tB3Hh4EPw7q7qaCH982srI1Imhvvow%3D%3D",
      "idchuong": 1
    },
    {
      "id": 338,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320421_043.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=BVh2qm9ogd6dyC3rzDlj8nK01bE7z0LQ5yoIrIvEVNqmsysmAQlbudCB2FdUrpbFtyBG57Qqrdcsvi0ENRcgv%2FcivYrJOt0HdUMFoHtMTlmDbDZ8Nq1fnL6IGLMR7NJva9Wfp2SYMuap2IhZnmN0rnYTwhk2GQMEpKETNPdcn14jih3YGluFZZOpoKo5OzQYCSBP%2FKtBecrMvzxNeczrUkVlRP3QDRgJhQ1DLBCeeKob8I4tMyoKCmSVXDNxKJtl67%2FMZALLy0sMDnuBRYejxWoWnpAJ4XHWFBORAs78axvva%2BiPXJMeF1uNw1NeV0TVZgyldKSuniV64GgiPq%2FqBg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 339,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320422_044.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=k8qlJwn9xxs91%2BHubzxGUCnk1RunL5zGvIRwggnt1JN3GaoduvRVravEGV%2BKdFg1xguXt6weNgF0%2F4xRQiD09ObWgt2manrPTRuh91r2HOs566XBaLP4SJr%2FiHfHj99nEK6gVCQEpK%2FPxhL3%2FTVRKikPTiSh6AD06iOLGSFbLhNiM8cG%2BSVc3cZY0XjbcjUU7bXTkCto8aDGES2l5Fm4RiuhhkZ2HAtnulS%2BcumhhOYYNGsNp2qsu5lurXg%2FRRBRtimjbNls0BAHXhE9SYHqWXPpuNDhgXNYUobpCUSmRKVxgnyFDFQYoOfbGvIF3S9W4vrJZ2qUZn%2FuonFuqFuXnQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 340,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320512_045.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=gEWGi66L%2BH5DPyd0Xa9f%2FYfpQ98QX7mDZtt%2Bg88Lu82yeN6xzBukcjR2MxH3vzGF%2BfG2AFgydamG13vkDPoLCJQYSb%2FYWP699DKMRwO2dL6tGi%2FbXe9HZcceNK0%2FVfnrw6UVDFP%2FnAI%2B9DVt4Fs3vw15cBsaMenNoRSlcNM3QOkdkuy3cJEB8stsJCCm6SGaks%2BECV9z9x%2FYeyM%2FKVGMAHLcB%2FPEr4hxnSRo%2FuwgJPvO6hsNL7FJgQRYzk9SclwRSMRTDaSwZEDSwoq3LEwK%2FI9qS6cQc9bagkiYxMpoWKCCa633Adj5GgnIpCqyLksYf8CHm%2BGOKRj%2BEeTnjLU0eQ%3D%3D",
      "idchuong": 1
    },
    {
      "id": 341,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320513_046.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=Uuhm1mM9V5xyG7%2BiSco6dXVyNqtAJCTA4%2Bf7fhv4fzAlzCnb7e2fbFGeDVirzmDnspIltpxP5wLatiWt2%2FE0Y2uAM3EJslS%2B04fj0prgZ4m8QcoAJNUoP7aFHBe30VTlLLYegshNUzeFZys83DktI8%2BWEyVX3KLeviyfVoNxEXiu4jXfbm%2BS7OEqn%2B9FMNgQ5RtWQndYtlL8CCAHwC4GsQ4jlmj9xh6SkCduddvuNxfWqTNLysvSWIC9ntaApPNY48SH2lDsMiygv6ff66ap6ReMyRySx2xaqfsheQVxlG%2Fx3Ilk0Q%2Bn5lZN2qg2B%2BTMhCKwjYb9gJ%2FFwl4W7EU0Hg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 342,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320514_047.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=cFP3Jy3lS74JTy5ldpf%2BDNMOOBkotOrEsaJBjWetjCeRI2ieF74RxKcGQx3zpCqyEAeoZd4bTcNr0FlekYYxFcUyYBunpj%2BCnz%2F%2BgcJcAM51PXkcBIyHouOpB%2F6m3KzX1KoOXH2SdqrlPziczgDKxKWDVN5M8mwLrzsrSRsM0ewNjUCBqALoO6vRJm6HZhsBMcF33hfExy5Ijy%2B1IFj%2Fvx5lKkjN%2B0MXvFaeAYwc0yvyDGdwgFmaCHs9%2BSN88k7GRpju%2FrHsPqcW8TGFgzJ%2B%2FidWXG0Uy4eq8ztaNDlSA0n4uOYUj%2FYvHu6MF%2F2BeGARWhtmKv3DzvN8fCc1ohdwTg%3D%3D",
      "idchuong": 1
    },
    {
      "id": 343,
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/chuong/1678170320515_048.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=OrOir8xH5x8yuKFQ1%2Fz7aRxncpFgFLcVTWUML4MwBzebv22YZLkPf6%2F8OHt3Bs5uhcvl9ey14LFyjMCTntPWnfjfMXd7yO5dfgtAkrBnDOqLplry5enJdMF6iowud9%2FLQrG36kIXHsB%2F%2BL8rj9pgbR%2FH%2B6BHtu8yGwuJc%2FsUtEco5T5M6cesnxcMV5sq3wcbPC9xTH4PwG6yWEp0dwi4eciWq4dD3eRwbeZWd5KJuiPIxS%2BQkLqPK%2BCMgrA43hXW8isWCqBswbASnhXK7oBCWeFaYIC3tH2uCCyQmjqF5z%2FurBFRZXhTM09gKF76hjq6w6BXLQijx40D%2FCZMFDZMyQ%3D%3D",
      "idchuong": 1
    }
  ];
  List<Map<String, dynamic>> listChuong = [
    {
      "id": 67,
      "tenchuong": "Chapter 6: Tôi vs Nanase vs Em gái",
      "sochuong": 6,
      "ngaycapnhat": "2023-03-06T23:35:03.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": null,
      "tongsoluot": 7
    },
    {
      "id": 5,
      "tenchuong": "Chapter 5: Cuộc viếng thăm bất ngờ của cô em gái",
      "sochuong": 5,
      "ngaycapnhat": "2023-03-06T23:34:09.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 30
    },
    {
      "id": 4,
      "tenchuong": "Chapter 4: Hình phạt của Nanase",
      "sochuong": 4,
      "ngaycapnhat": "2023-03-06T23:32:31.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 20
    },
    {
      "id": 3,
      "tenchuong": "Chapter 3: Em yêu anh vì XX",
      "sochuong": 3,
      "ngaycapnhat": "2023-03-06T23:31:28.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 26
    },
    {
      "id": 2,
      "tenchuong": "Chapter 2: Nô lệ của công ty mất nhà",
      "sochuong": 2,
      "ngaycapnhat": "2023-03-06T23:29:53.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 36
    },
    {
      "id": 1,
      "tenchuong": "Chapter 1: Cô gái tên Nanase",
      "sochuong": 1,
      "ngaycapnhat": "2023-03-06T23:25:27.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 75
    },
    {
      "id": 67,
      "tenchuong": "Chapter 6: Tôi vs Nanase vs Em gái",
      "sochuong": 6,
      "ngaycapnhat": "2023-03-06T23:35:03.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": null,
      "tongsoluot": 7
    },
    {
      "id": 5,
      "tenchuong": "Chapter 5: Cuộc viếng thăm bất ngờ của cô em gái",
      "sochuong": 5,
      "ngaycapnhat": "2023-03-06T23:34:09.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 30
    },
    {
      "id": 4,
      "tenchuong": "Chapter 4: Hình phạt của Nanase",
      "sochuong": 4,
      "ngaycapnhat": "2023-03-06T23:32:31.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 20
    },
    {
      "id": 3,
      "tenchuong": "Chapter 3: Em yêu anh vì XX",
      "sochuong": 3,
      "ngaycapnhat": "2023-03-06T23:31:28.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 26
    },
    {
      "id": 2,
      "tenchuong": "Chapter 2: Nô lệ của công ty mất nhà",
      "sochuong": 2,
      "ngaycapnhat": "2023-03-06T23:29:53.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 36
    },
    {
      "id": 1,
      "tenchuong": "Chapter 1: Cô gái tên Nanase",
      "sochuong": 1,
      "ngaycapnhat": "2023-03-06T23:25:27.000Z",
      "idtruyen": 1,
      "idnguoidung_da_doc": 1,
      "tongsoluot": 75
    }
  ];

  List<Map<String, dynamic>> listComment = [
    {
      "id": 49,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Hay",
      "ngaybinhluan": "2023-03-22T12:14:56.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 47,
      "idnguoidung": 10,
      "idtruyen": 1,
      "noidung": "Nice",
      "ngaybinhluan": "2023-02-28T13:04:53.000Z",
      "tennguoidung": "Lê Văn Duẫn",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1677589325446_2f9609ce-7e98-4779-98c8-329e417fdf8e.jpeg?alt=media&token=55e59b08-1a02-4dd0-b229-7646bc82441f"
    },
    {
      "id": 46,
      "idnguoidung": 9,
      "idtruyen": 1,
      "noidung": "Chào",
      "ngaybinhluan": "2023-02-24T02:55:55.000Z",
      "tennguoidung": "Meo meo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1677379216043_5cfd7bed-7375-476b-b69d-2d0fa3f40a0a.jpeg?alt=media&token=452e1e5c-59c3-43b4-9b79-b03a7105b809"
    },
    {
      "id": 44,
      "idnguoidung": 8,
      "idtruyen": 1,
      "noidung": "Hay đấy",
      "ngaybinhluan": "2023-02-12T22:30:07.000Z",
      "tennguoidung": "Hà Thu",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676240973274_d75a08dd-e8b8-4ef6-9dd4-5dcd44852361.jpeg?alt=media&token=1309928b-26e4-4f99-b2b1-95b82d22a872"
    },
    {
      "id": 43,
      "idnguoidung": 7,
      "idtruyen": 1,
      "noidung": "Xuất sắc",
      "ngaybinhluan": "2023-02-12T22:20:01.000Z",
      "tennguoidung": "Lý Thị Hoa",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676240265667_cca93e6c-621c-4ea8-822e-d0ae8b83d9f2.jpeg?alt=media&token=1b9be1a8-07d0-4ca8-8d72-9a6e718926ac"
    },
    {
      "id": 42,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Hay quá",
      "ngaybinhluan": "2023-02-12T21:55:49.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 40,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Test bình luận lần 3",
      "ngaybinhluan": "2023-02-10T22:31:32.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 39,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Test bình luận 2",
      "ngaybinhluan": "2023-02-10T22:29:49.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 38,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Test bình luận 1",
      "ngaybinhluan": "2023-02-10T22:28:38.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 37,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 36,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 35,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 34,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 33,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:26:44.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 31,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 32,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 30,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 29,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 28,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:53.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 27,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 26,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 25,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 24,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 23,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T21:23:33.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 6,
      "idnguoidung": 5,
      "idtruyen": 1,
      "noidung": "Tuyệt vời ông mặt trời :))",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "User 5",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 5,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 4,
      "idnguoidung": 3,
      "idtruyen": 1,
      "noidung": "Quá ghê gớm!!!!!!",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "Trần Bá",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1676591448513_aaeaa6ee-c579-4d62-a2d1-12960d717c87.jpeg?alt=media&token=89d0323f-e6f6-4c92-8705-d12e0e605df5"
    },
    {
      "id": 3,
      "idnguoidung": 2,
      "idtruyen": 1,
      "noidung": "Hay ghê á!!!!!!",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "Nguyen Thi Hoa",
      "avatar":
          "https://genk.mediacdn.vn/zoom/700_438/2017/panda-1024-1488876248329-crop-1488876277745.jpg"
    },
    {
      "id": 2,
      "idnguoidung": 4,
      "idtruyen": 1,
      "noidung": "Đỉnh thật sự",
      "ngaybinhluan": "2023-02-10T19:52:24.000Z",
      "tennguoidung": "User 4",
      "avatar":
          "https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2019/10/meo-anh-long-ngan-11.jpg"
    },
    {
      "id": 1,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Hay quá!!!!!!",
      "ngaybinhluan": "2023-02-10T19:47:05.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    },
    {
      "id": 22,
      "idnguoidung": 1,
      "idtruyen": 1,
      "noidung": "Quá đỉnh :))",
      "ngaybinhluan": "2022-12-01T05:00:00.000Z",
      "tennguoidung": "Nguyễn Văn Tèo",
      "avatar":
          "https://firebasestorage.googleapis.com/v0/b/app-comic-reading.appspot.com/o/avatar%2F1678880613465_a0a963a1-2cb8-4a87-ba0f-b7ede566660c.jpeg?alt=media&token=5140dcb4-340a-4c5c-bbb4-f62154da4740"
    }
  ];
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      _timer?.cancel(); // Hủy bỏ đối tượng Timer hiện tại (nếu có)
      _timer = Timer(Duration(milliseconds: 1000), () {
        _showBoxPosition = true;
        setState(() {});
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      _timer?.cancel(); // Hủy bỏ đối tượng Timer hiện tại (nếu có)
      _timer = Timer(Duration(milliseconds: 1000), () {
        _showBoxPosition = false;
        setState(() {});
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Container(
                    height: 50,
                    color: myColors.whiteOrBlack,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          splashColor: Colors.black,
                          splashRadius: 22,
                          icon: Icon(Icons.arrow_back,
                              color: myColors.blackOrWhite),
                        ),
                        Text(
                          'ID chương ${widget.id}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DialogListChuong(
                                  listChuong: listChuong,
                                  index: widget.index,
                                );
                              },
                            );
                          },
                          splashColor: Colors.black,
                          splashRadius: 22,
                          icon: Icon(Icons.list, color: myColors.blackOrWhite),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: listImage.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                          color: Colors.grey,
                          child: Image.network(listImage[index]['imagelink']));
                    },
                  ),
                ],
              ),
            ),
            if (_showBoxPosition)
              Positioned(
                child: Container(
                  height: screenHeight,
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        color: myColors.whiteOrBlack,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              splashColor: Colors.black,
                              splashRadius: 22,
                              icon: Icon(Icons.arrow_back,
                                  color: myColors.blackOrWhite),
                            ),
                            Text(
                              'ID chương ${widget.id}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return DialogListChuong(
                                      listChuong: listChuong,
                                      index: widget.index,
                                    );
                                  },
                                );
                              },
                              splashColor: Colors.black,
                              splashRadius: 22,
                              icon: Icon(Icons.list,
                                  color: myColors.blackOrWhite),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 50,
                          width: screenWidth,
                          color: Colors.black.withOpacity(0.7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  print('trước sau');
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 16,
                                      color: AppColors.ogrange,
                                    ),
                                    Text(
                                      'Trước',
                                      style: TextStyle(
                                        color: AppColors.ogrange,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  print('trước sau');
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Sau ',
                                      style: TextStyle(
                                        color: AppColors.ogrange,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 16,
                                      color: AppColors.ogrange,
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  print('tap favorite');
                                },
                                splashColor: Colors.black,
                                splashRadius: 22,
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showMySlidingSheet(context, listComment);
                                },
                                splashColor: Colors.black,
                                splashRadius: 22,
                                icon: Icon(Icons.message_outlined,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Widget buildSheet(BuildContext context, SheetState state) {
//   return Material(
//     child: Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Column(
//         children: [
//           Container(
//             height: 30,
//             color: Colors.red,
//           ),
//         ],
//       ),
//     ),
//   );
// }

class DialogListChuong extends StatefulWidget {
  const DialogListChuong({
    Key? key,
    required this.listChuong,
    required this.index,
  }) : super(key: key);

  final listChuong;
  final int index;

  @override
  _DialogListChuongState createState() => _DialogListChuongState();
}

class _DialogListChuongState extends State<DialogListChuong> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        widget.index * 56, // Kích thước của mỗi item trong ListView
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(16),
      child: Container(
        constraints: BoxConstraints(maxHeight: screenHeight * 0.6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: myColors.backgroundColorBottomSheet,
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.listChuong.length,
          controller: _scrollController, // Thêm ScrollController vào ListView
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 56,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Text(
                      widget.listChuong[index]['tenchuong'],
                      style:
                          TextStyle(color: myColors.blackOrWhite, fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2),
                          ),
                        ),
                        Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            color: index == widget.index
                                ? AppColors.ogrange
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: index == widget.index
                                    ? Colors.grey
                                    : Colors.transparent,
                                width: 2),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
