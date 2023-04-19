import 'package:comic_reading/common/extension/custom_theme_extension.dart';
import 'package:comic_reading/widgets/header_bar_widget.dart';
import 'package:comic_reading/widgets/my_grid_view_widget.dart';
import 'package:comic_reading/widgets/slide_view_widget.dart';
import 'package:flutter/material.dart';

class TrangChuPage extends StatefulWidget {
  const TrangChuPage({super.key});

  @override
  State<TrangChuPage> createState() => _TrangChuPageState();
}

class _TrangChuPageState extends State<TrangChuPage> {
  List<Map<String, dynamic>> data = [
    {
      "id": 19,
      "tentruyen": "AJIN-CHAN WA KATARITAI",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Nếu bạn là thầy giáo và học sinh đều là những em lai quỷ dễ thương, bạn sẽ làm gì? theo dõi để xem anh main chúng ta sẽ xử lí thế nào với những vấn đề hết sức cute của mấy em này nhé.",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/177/ajin-chan-wa-kataritai.jpg",
      "tongluotxem": 2,
      "tongtheodoi": 0,
      "tongdanhgia": 0,
      "sosaotrungbinh": null,
      "ngaycapnhat": "2023-03-07T02:15:42.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 5,
      "tentruyen": "Ningen Fushin No Boukenshatachi Ga Sekai O Sukuu Youdesu ",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Câu chuyện về bốn nhà thám hiểm, tất cả những người đã trải qua sự phản bội và khó khăn, cùng nhau vươn lên trong xã hội. Nhóm dịch : Sứa fuho team",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/227/ningen-fushin-no-boukenshatachi-ga-sekai-9739.jpeg",
      "tongluotxem": 10,
      "tongtheodoi": 2,
      "tongdanhgia": 8,
      "sosaotrungbinh": 3.125,
      "ngaycapnhat": "2023-03-07T01:40:57.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 17,
      "tentruyen": "DEAD MOUNT DEATH PLAY",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Một thể loại xuyên không nhưng là xuyên không từ thế giới fantasy sang thế giới hiện đại. một trò chơi hại não và kinh dị bắt đầu",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/203/dead-mount-death-play.jpg",
      "tongluotxem": 2,
      "tongtheodoi": 2,
      "tongdanhgia": 3,
      "sosaotrungbinh": 4.3333,
      "ngaycapnhat": "2023-03-07T01:34:50.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 22,
      "tentruyen": "OTTOMAN: ÔNG CHỒNG QUỐC DÂN",
      "tenkhac": "オットマン-OTTOMAN",
      "tinhtrang": 1,
      "mota":
          "Soya là một nhân viên văn phòng, suốt ngày chỉ trải qua chuỗi ngày vô vị lặp đi lặp lại,làm con chó cụt đuôi cho sếp lớn , trong khi bản thân lại nuôi dưỡng ước mơ trở thành họa sĩ truyện tranh. Cho đến một ngày,anh bị xe tải đâm nát bét và bị một sinh vật ngoài hành tinh ký sinh vào cơ thể !? Hơn nữa,người vợ Yuka của anh còn bị lũ quái vật bắt nhốt với ý định ăn thịt...! Soya, với quyết tâm trở thành \"OTTOMAN\" đã chạy nhanh hết sức để có thể bảo vệ cho người vợ yêu dấu của mình!*Xuất bản trên tạp chí Weeky young jump bắt đầu từ 5/8",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678171138712_ottoman-ong-chong-quoc-dan.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=dfYqK1s33ReeWSQ3cyUX0H%2F2DLr4JB4x59Vi5umqjNLudgS47HjiBRLmIs8aPhRERrZSeCdLEDm%2F8si96SVeMRCnNpXzQtxvsmtDgw5wkFW8U25cillEZySlk5IyKbNoNXKpZDNoLl1AayC%2FWAtWivcmZNdv795WvV%2Fo4LITWKk6U06HQ%2B1Z23cxMoXi5wFFXqdPVl6fc3JubUUXaHZW0O5LKxWpE3aA1f0ZZKVdS7f91up8ifuQnDiBii33nrChm8zBnueRAZk1JlL4lDKs%2F0C7dw8uTXQgY5opxs9M6xg9tj1y3cr%2B4I6mdodDA1k%2Bnx2H4b5ZJ1ztP4DVlbX4Dw%3D%3D",
      "tongluotxem": 19,
      "tongtheodoi": 1,
      "tongdanhgia": 0,
      "sosaotrungbinh": null,
      "ngaycapnhat": "2023-03-07T01:14:53.000Z",
      "chuongmoinhat": 4
    },
    {
      "id": 1,
      "tentruyen": "Nanase-san no Koi ga Ijou",
      "tenkhac": "Cô nàng cuồng tình Nanase",
      "tinhtrang": 1,
      "mota":
          "Takahashi đã gặp được Nanase, một cô gái dễ thương và trong sáng thông qua ứng dụng hẹn hò. Quan hệ của cả hai ngày càng tiến triển một cách tốt đẹp rồi bỗng dưng một ngày nọ Takahashi được Nanase mời tới nhà mình chơi và chứng kiến một cảnh tượng bất ngờ",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678169651281_co-nang-cuong-tinh-nanase.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725200400&Signature=H8p5Zwq4%2B90Li1i%2FkvglPeR6p4PjYqan4qoBsyeYqPUrWa9F%2FP41X%2FnK2SmYM9yC3eZgO6jNIJ4OCMo%2BdvZPRsHCEGlcSN9riP2hN3gIkEjqFi1U7B00W4KiDMf3qAOCE%2FmUryuH9OZ1j3prSmg6ZIqNnBiyb%2BtBuV4ZmP3rVH0DxLxvIHymVQPVS1LDEmCYQFm7Lh7sippEcn02j0h%2B2LoXib8nv43uOv%2FH9lYpsyWuGcRoSBxvSBnXy8nlrGIhjEKOJVlW1YzQRRkWYuEFATLU%2BLgogUNsaHzRgzU%2BNl0E3OLIlbIIhF3B9lhsSbd%2FtjpTJDHN1%2BKtpIxEts9DDQ%3D%3D",
      "tongluotxem": 194,
      "tongtheodoi": 8,
      "tongdanhgia": 11,
      "sosaotrungbinh": 3.8182,
      "ngaycapnhat": "2023-03-06T23:35:03.000Z",
      "chuongmoinhat": 6
    }
  ];

  List<Map<String, dynamic>> data2 = [
    {
      "id": 21,
      "tentruyen": "ISEKAI SHOKUDOU",
      "tenkhac": "Quán Ăn Dị Giới",
      "tinhtrang": 1,
      "mota":
          "Câu chuyện kể về một quán ăn kiểu Âu truyền thống, tọa lạc tại một góc nghèo nàn của khu mua sắm, mở cửa vào giờ làm việc và đóng cửa vào ngày nghỉ và cuối tuần. Tuy nhiên, có một ngoại lệ đặc biệt: quán ăn bí mật mở cửa vào thứ bảy, phục vụ các thực đơn đặc biệt cho các vị khách ở thế giới khác.",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678186471225_isekai-shokudou.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725200400&Signature=NVZ3aQNOMGl%2BEi%2FzTgKz84jd2OoW9kNwkD3NxTSFf5b8xd7VIagZKftWTjtlLiEGZf9KmRw%2FV6CKloDekDDLFjHJxQbZYuE6ABwa6awMTFQzPyHn33zt9PQq99lqDqGDYFVdvw1te9rfspBiZXUG4%2F68vLqz0I4T%2Fr97H4r%2FYi8QSYJcK0mESIcCuOLVlCCHF8pRE12oR8B9a63HnjhA8qqgWbpcdzzYOlEpVc0o7jQ4dl7JH4EsyW66ikATfnNWH09Vc6rwwE1zR%2ByFDupF7kpS1ka3hdrBFqqBnhpQYEeGemN1r59pz6w5JbZQYpaDYWKsdJXTmeePhuRceFoD8Q%3D%3D",
      "tongluotxem": 3,
      "tongtheodoi": 0,
      "tongdanhgia": 0,
      "sosaotrungbinh": null,
      "ngaycapnhat": "2023-03-07T03:56:08.000Z",
      "chuongmoinhat": 1
    },
    {
      "id": 9,
      "tentruyen": "PLAYER",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Vào một đêm khuya, trong một con hẻm của một thị trấn nhỏ đã xảy ra một vụ án giết người kỳ quái. Một vài thanh niên đã gặp một kẻ sát nhân tâm thần trên đường về nhà sau ca trực đêm. Sau khi chiến đấu, họ phát hiện ra rằng kẻ sát nhân tâm thần là bất khả xâm phạm. Vào thời khắc quyết định đó, một “thiên thần” đã xuất hiện và tiêu diệt ác quỷ. Tuy nhiên, 'thiên thần' có vẻ ngoài bình thường đã đánh bạc với ác quỷ là ai? Thiện ác của con người không chỉ quyết định sự thành bại của canh bạc; nó cũng sẽ quyết định số phận của cả loài người.",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678185787261_player.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725200400&Signature=CA%2B4LPlrduJ6RX8ISVp0Hs%2FuInichBZJ62cRsikHt9JvvdL21BMjSEESPWJzKSWZt2nDjMI9W524lk6VOvg6t29sNZZqSWP%2FdRfPJ7eyApgEXpxyL%2FWOkukAJ2tsUjibPHm4Q7dk4TV8k04hPMdAf7B0PHl%2BKCMFoMRkhCBvdA2AFnXMcpwUR94eQcGAiADPgMC6S3fQ%2FvwC7sLJ7mmnCcvYHq0pJtLVwPUpkpCwKSVRf48sXuPJPE1bf%2Ff4pYhHETgI7TE77wiYDUGJ7A5xHFoMYcPYbhZIvBrDhIP31G5ESPVpTFOqsyn1ufigxq%2FrWLaAqbdm3bfX9sFn2A2eRg%3D%3D",
      "tongluotxem": 13,
      "tongtheodoi": 3,
      "tongdanhgia": 1,
      "sosaotrungbinh": 4,
      "ngaycapnhat": "2023-03-07T03:44:51.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 14,
      "tentruyen": "USOGUI",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Trong các sòng bạc chui tại nhật bản,nơi mạng sống của người chơi cũng có thể mang ra cá cược như những món đồ.Sòng bạc cùng các thế lực lớn ở đây luôn tìm mọi cách để móc túi người chơi,biến họ thành những con nợ.Baku Madarame một con bạc đã giúp nhiều người thoát khỏi cám dỗ.....",
      "imagelink": "https://st.nettruyenup.com/data/comics/77/usogui.jpg",
      "tongluotxem": 3,
      "tongtheodoi": 0,
      "tongdanhgia": 2,
      "sosaotrungbinh": 1.5,
      "ngaycapnhat": "2023-03-07T03:32:48.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 6,
      "tentruyen": "UCHI NO OTOUTO-DOMO GA SUMIMASEN",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Mẹ của Ito đã tái hôn và cô bắt đầu cuộc sống mới với tư cách là chị gái của 4 anh chị em! Sự khởi đầu của một bộ phim hài tình yêu gia đình với bốn anh em sẽ bắt đầu và kết thúc như thế nào!?",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/11/uchi-no-otouto-domo-ga-sumimasen.jpg",
      "tongluotxem": 10,
      "tongtheodoi": 3,
      "tongdanhgia": 2,
      "sosaotrungbinh": 2.5,
      "ngaycapnhat": "2023-03-07T03:30:46.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 4,
      "tentruyen":
          "The Fragrant Flower Blooms With Dignity - Kaoru Hana Wa Rin To Saku",
      "tenkhac": "Những đóa hoa thơm nở diễm kiều, Kaoru Hana Wa Rin To Saku",
      "tinhtrang": 1,
      "mota":
          "Ở một nơi nào đó, có 2 trường cao trung lân cận. Cao trung Chidori, một trường nam sinh cấp thấp hội tụ đủ những thằng đần, trường nữ sinh Kikyo, một trường nữ sinh danh giá . Rintaro Tsugumi, một nam sinh năm 2 to khỏe và trầm tính tại trường Chidori, bắt gặp Kaoruko Waguri, một khách hàng khi cậu đang giúp việc tại cửa hàng bánh nhà mình . Rintaro cảm thấy thoải mái khi dành thời gian bên Kaoruko, nhưng cô lại là học sinh của trường Kikyo, ngôi trường hàng xóm cực kì căm ghét trường Chidori. Đây là câu chuyện về 2 con người ở rất gần nhưng lại rất xa",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/177/the-fragrant-flower-blooms-with-dignity-4746.jpg",
      "tongluotxem": 30,
      "tongtheodoi": 6,
      "tongdanhgia": 10,
      "sosaotrungbinh": 2.9,
      "ngaycapnhat": "2023-03-07T03:28:30.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 7,
      "tentruyen": "SHIBUYA KINGYO",
      "tenkhac": "Shibuya Kingyo - Cá Vàng Sát Thủ",
      "tinhtrang": 1,
      "mota":
          "Tsukiyoda, một chàng trai nhút nhát, không thể hòa nhập được với cuộc sống hiện đại, sau khi giúp đỡ cô bạn nổi tiếng cùng trường và được trả công bằng bữa trưa. Những tưởng cuộc sống của mình đã thay đổi, nhưng không mọi thứ thay đổi",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/89/shibuya-kingyo.jpg",
      "tongluotxem": 6,
      "tongtheodoi": 0,
      "tongdanhgia": 4,
      "sosaotrungbinh": 3,
      "ngaycapnhat": "2023-03-07T03:25:55.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 10,
      "tentruyen": "MURABITO TENSEI: SAIKYOU NO SLOW LIFE",
      "tenkhac": "Murabito Tensei: Saikyo No Slow Life",
      "tinhtrang": 1,
      "mota":
          "Chúa đã vô tình giết chết tôi và cho tôi được chuyển sinh. Sống trong một ngôi làng nhỏ bé và được vây quanh bởi cô em gái xinh đẹp, những cô bạn gái thơ ấu. Hãy cùng tôi tận hưởng cuộc sống yên bình ở thế giới mới này nào!",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/169/murabito-tensei-saikyou-no-slow-life.jpg",
      "tongluotxem": 2,
      "tongtheodoi": 2,
      "tongdanhgia": 3,
      "sosaotrungbinh": 1.6667,
      "ngaycapnhat": "2023-03-07T03:23:05.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 8,
      "tentruyen": "LOẠN ĐẤU TOKYO",
      "tenkhac": "Tokyo Kettou Kanjousen",
      "tinhtrang": 1,
      "mota":
          "\"Giải đấu Tokyo Loop Line\" là một hệ thống chính thức được dùng để hỗ trợ sự khôi phục và phát triển nề kinh tế cho thủ đô Tokyo sau Thế chiến thứ 2, nhằm giải quyết bất đồng giữa các cộng đồng có địa phận nằm trên tuyến tàu Yamanote. Và sau một khoảng thời gian dài yên bình. Mâu thuẫn lại một lần nữa được đẩy cao với sự xuất hiện của một nha ga Takanawa mới khai trương và lợi nhuận khổng lồ nó có thể mang lại. Do đó \"Giải đấu Tokyo Loop Line\" cũng được hồi sinh để giải quyết những tranh chấp nảy sinh từ lòng tham. Và nhân vật chính của chúng ta, Yasuda Koinosuke - đấu sĩ đại diện của ga Kanda, chính thức tham chiến!",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/39/loan-dau-tokyo.jpg",
      "tongluotxem": 3,
      "tongtheodoi": 3,
      "tongdanhgia": 6,
      "sosaotrungbinh": 2.6667,
      "ngaycapnhat": "2023-03-07T03:20:43.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 15,
      "tentruyen": "HOKENSHITSU NO TSUMURI-SAN",
      "tenkhac": "Cô y tế Tsumuri",
      "tinhtrang": 1,
      "mota": "Cô y tá hay ngất xỉu, lười biếng, chậm chạp, lơ đễnh",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/12/hokenshitsu-no-tsumuri-san.jpg",
      "tongluotxem": 3,
      "tongtheodoi": 2,
      "tongdanhgia": 5,
      "sosaotrungbinh": 3.4,
      "ngaycapnhat": "2023-03-07T03:13:33.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 18,
      "tentruyen": "HITOTSU YANE NO SHITA NO",
      "tenkhac": "...Under One Roof",
      "tinhtrang": 1,
      "mota":
          "Năm nhất trung học Yuzuriha Kyuuta đã hứa với Ririko - người bạn tuổi thơ của cậu - rằng sẽ cưới cô ấy khi họ lớn lên. Bị chia cắt từ hồi tiểu học, cậu bây giờ đã nhập học cùng trường với cô ấy, một trường học nữ sinh dành cho những quý cô trẻ mới mở cho học sinh nam, để được gặp lại cô ấy. Nhưng để được gặp, cậu phải xuống trong kí túc xá nữ và cô ấy là trưởng kí túc xá? Và hơn nữa, cô ấy có vẻ không nhớ gì về cậu! Vậy Kyuuta sẽ làm thế nào để có thể giữ lời hứa của mình?",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/64/hitotsu-yane-no-shita-no.jpg",
      "tongluotxem": 1,
      "tongtheodoi": 1,
      "tongdanhgia": 2,
      "sosaotrungbinh": 5,
      "ngaycapnhat": "2023-03-07T03:10:22.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 20,
      "tentruyen": "GIA ĐÌNH CỦA NHỮNG CHIẾC BÓNG",
      "tenkhac": "Shadows House",
      "tinhtrang": 1,
      "mota":
          "Tại một vùng đất nọ, có những chiếc bóng sống cuộc sống giàu sang trong những tòa biệt thự khổng lồ, được phục vụ bởi những búp bê sống. Những búp bê này dành phần lớn thời gian để lau dọn bồ hóng được thải ra vô cùng tận từ những chủ nhân của họ. Hãy cùng theo dõi câu chuyện của Emilyko, một cô búp bê sống còn rất trẻ con và vui vẻ, đang học cách để phục vụ chủ nhân Kate của cô ấy.",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/56/gia-dinh-cua-nhung-chiec-bong.jpg",
      "tongluotxem": 2,
      "tongtheodoi": 3,
      "tongdanhgia": 3,
      "sosaotrungbinh": 2.3333,
      "ngaycapnhat": "2023-03-07T03:08:02.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 13,
      "tentruyen": "RE CERVIN",
      "tenkhac": "re Cervin, Re: Cervin",
      "tinhtrang": 1,
      "mota":
          "Arsinoe, cô Công chúa trẻ xứ Helenthal bỗng thức giấcvà chợt nhận ra rằng mình đã thiếp đi hàng tháng trờikể từ ngày Vương Quốc của mình bị Đế Chế Ilia xâm chiếm. Vào ngày đó, người mẹ của cô đã bị giết, Ác Long thức tỉnh,và quê hương của cô đã chìm trong biển lửa. Và với sức mạnh của Cent Fuana \"Cuồng nữ bạo thực ký ức\",cô đã có thể cầm chân con Ác Long,xong, cô đã mất đi ký ức về người cha của mình. Có một người đàn ông xuất hiện và tự xưng mình là cha của cô, ông ta tên Cervin. Một vị vua mất nước, và một cô công chúamất đi ký ức về người cha của mình.2 con người cùng nhau đi trên một hành trìnhnhằm để khôi phục lại những thứ đã bị đánh mất.",
      "imagelink": "https://st.nettruyenup.com/data/comics/231/re-cervin.jpg",
      "tongluotxem": 4,
      "tongtheodoi": 1,
      "tongdanhgia": 2,
      "sosaotrungbinh": 4,
      "ngaycapnhat": "2023-03-07T02:43:49.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 3,
      "tentruyen": "Fantasy Bishoujo Juniku Ojisan To",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Câu truyện hài lãng mãn của cặp đôi bạn thân. Một trung niên và một đã từng là trung niên",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678170244189_fantasy-bishoujo-juniku-ojisan-to.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=jIoqT7mEBbpMxZ0JmyaqAOFGhjs9Bzm0h49nrWltTmdSJcVQq4gjBsboe71cKtaqR%2BbBAiILWOuDeenpMO0Yj9lZZVxqnzTMKnJFhzBSEl4EYc4czPtSqUiEbeiiouhobkYiZ0QeMzsdlBFxvjYdOwF7kidLDubrqErSGj9gA%2F%2Ff0VWotpakY8QAHMzkm%2BLmMnjHQ20yNKxk%2Bxg4EMQ6cobkS9x5znYuHomQz%2BY0pFVkeA95VhKR9jN%2FKzlUEg3VBC8bB3QnwfDXAuuktEYoOsMq6Lv4CbFUbwvkKMh0Ci0hmTgpux5dz3T9eTsfByI0kq9dfnaM8qLtAjPDTVUnuw%3D%3D",
      "tongluotxem": 11,
      "tongtheodoi": 2,
      "tongdanhgia": 5,
      "sosaotrungbinh": 3.2,
      "ngaycapnhat": "2023-03-07T02:40:49.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 2,
      "tentruyen":
          "D-kyuu Boukensha No Ore, Naze Ka Yuusha Party Ni Kanyuu Sareta Ageku, Oujo Ni Tsukima Towareteru",
      "tenkhac":
          "Tôi là một Nhà thám hiểm hạng D, vì một số lý do mà tôi đã được tuyển dụng vào một đảng anh hùng, và bây giờ công chúa đang theo dõi tôi",
      "tinhtrang": 1,
      "mota":
          "Nếu bạn trở thành một anh hùng và đánh bại Quỷ Vương, một cuộc sống nhàn hạ đang chờ bạn ...! Đây là điều mà chàng trai trẻ Jirei tin tưởng, và anh ấy đã làm việc chăm chỉ cả ngày lẫn đêm để đạt được mục tiêu của mình. Tuy nhiên, khi phát hiện ra rằng những anh hùng đánh bại Quỷ Vương là những người đang làm tất cả những công việc khó khăn, anh ta đã bỏ chạy. Nhưng những cô gái mà Jirei đã cứu trong cuộc hành trình của anh ấy trước khi anh ấy biết điều đó lần lượt đổ về để giành lấy trái tim và thể xác của anh ấy ...?",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678169743275_d-kyuu-boukensha-no-ore-naze-ka-yuusha-p-9809.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725200400&Signature=G1zq6RkkiKmLUuY7r%2B99Aeb0QtO24oRH3snfveB2rlOeI%2B3TKCkuW2jcwyqtP1L5gh4UOeF19SVPVPJY21XY%2Ba0%2FAIVIdFTR9VfLSF6goXQqxl65xRYul0vupoqPZO4WCshb5VKSKCVnCIf9%2BhD8KFIxogIH0mlf%2BH1GlVxf75NyiK4U%2BluCmV4Gk7VAghGU49lhkw1aofts5iEbopZ6eNoa93Fj1sxzYeMkHq6bY8SkH0IYqlbSwOl44cWBfANCN3EYl%2Fqjg%2BnWZ9%2Ba3OYCgVd%2FMHLPnm5xXMGZrKE%2FgBvzTgOjzZlnA8D2qHs5TJslNnzYPtba%2F3AOxuROGgoM0A%3D%3D",
      "tongluotxem": 6,
      "tongtheodoi": 3,
      "tongdanhgia": 7,
      "sosaotrungbinh": 3.2857,
      "ngaycapnhat": "2023-03-07T02:37:45.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 16,
      "tentruyen": "BOKU WA AYASHII KIMI NO MONO",
      "tenkhac": "I Belong to You, Immoral",
      "tinhtrang": 1,
      "mota":
          "Shou-chan là thành viên của ban đạo đức. Cậu muốn có một cuộc sống học đường lành mạnh, sống theo lý tưởng của Bác Hồ vĩ đại. DĨ nhiên đời không như mơ, bạn thuở nhỏ của cậu- Sayo lại là một succubus. Liệu main của chúng ta có giữ tỉnh táo được đầu trên hay sẽ bị đầu dưới chi phối?",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/85/boku-wa-ayashii-kimi-no-mono.jpg",
      "tongluotxem": 7,
      "tongtheodoi": 2,
      "tongdanhgia": 4,
      "sosaotrungbinh": 3,
      "ngaycapnhat": "2023-03-07T02:35:35.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 12,
      "tentruyen": "BÍ ẨN TRONG THẾ GIỚI MA THUẬT",
      "tenkhac":
          " Lord El-Melloi II's Case Files (manga) フェイト/エクストラ Rōdo Erumeroi Nisei no Jikenbo",
      "tinhtrang": 1,
      "mota":
          "\"...Theo một nghĩa nào đó, có thể nói rằng pháp sư hiện đại chính là nghề sưu tập thiên sứ\" \"Tháp Đồng Hồ\". Đó là trung tâm của thế giới pháp sư. Đại bản doanh của Hiệp Hội Pháp Sư, nơi nắm giữ những thần bí quý giá. El-Melloi II, Lord của Khoa Ma Thuật Hiện Đại trong \"Tháp Đồng Hồ\" này, vì một số lý do, đã bị cuốn vào vụ thừa kế gia sản ở Lâu đài Biệt cư Adra. Có rất nhiều thiên sứ tạc khắc bên trong lâu đài, và chỉ người nào giải được bí ẩn về cái \"Tên Thiên Sứ\" được trao cho mỗi vị khách được mời tới, thì mới được thừa kế \"di sản\" của Lâu đài Biệt cư Adra. Thế nhưng, đó không đơn thuần chỉ là việc giải câu đố, mà còn là khởi đầu của một sự kiện bi thương vô cùng huyền hoặc, thậm chí đối với cả những pháp sư chức vị cao thuộc \"Tháp Đồng Hồ\". \"Hồ sơ của Lord El-Melloi II\", một sự pha trộn giữa ma thuật và thần bí, ảo tưởng và bí ẩn, xin được phép bắt đầu.",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/170/bi-an-trong-the-gioi-ma-thuat.jpg",
      "tongluotxem": 5,
      "tongtheodoi": 3,
      "tongdanhgia": 5,
      "sosaotrungbinh": 4.2,
      "ngaycapnhat": "2023-03-07T02:25:06.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 11,
      "tentruyen": "ARTE",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Vào thế kỉ 16, nước Ý - Firenze, là cái nôi của thời kì Phục hưng, nơi nghệ thuật phát triển mạnh mẽ. Ở một góc nhỏ của thành phố rộng lớn này, hành trình của một cô gái sống một cuộc sống êm ả nhưng ấp ủ hoài bão về nghệ thuật bắt đầu. Cô ao ước trở thành một họa sĩ, một sự nghiệp bất khả thi cho một cô gái sinh ra trong một gia đình quí tộc. Vào thời đó, nghệ thuật là một nghề dành riêng cho phái nam, đối với một người phụ nữ sẽ vấp phải làn sóng phân biệt đối xử mạnh mẽ. Bất chấp những thử thách, Arte vẫn kiên trì với sự cần mẫn và thái độ tích cực của mình!",
      "imagelink": "https://st.nettruyenup.com/data/comics/235/arte.jpg",
      "tongluotxem": 4,
      "tongtheodoi": 4,
      "tongdanhgia": 3,
      "sosaotrungbinh": 2,
      "ngaycapnhat": "2023-03-07T02:19:10.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 19,
      "tentruyen": "AJIN-CHAN WA KATARITAI",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Nếu bạn là thầy giáo và học sinh đều là những em lai quỷ dễ thương, bạn sẽ làm gì? theo dõi để xem anh main chúng ta sẽ xử lí thế nào với những vấn đề hết sức cute của mấy em này nhé.",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/177/ajin-chan-wa-kataritai.jpg",
      "tongluotxem": 2,
      "tongtheodoi": 0,
      "tongdanhgia": 0,
      "sosaotrungbinh": null,
      "ngaycapnhat": "2023-03-07T02:15:42.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 5,
      "tentruyen": "Ningen Fushin No Boukenshatachi Ga Sekai O Sukuu Youdesu ",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Câu chuyện về bốn nhà thám hiểm, tất cả những người đã trải qua sự phản bội và khó khăn, cùng nhau vươn lên trong xã hội. Nhóm dịch : Sứa fuho team",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/227/ningen-fushin-no-boukenshatachi-ga-sekai-9739.jpeg",
      "tongluotxem": 10,
      "tongtheodoi": 2,
      "tongdanhgia": 8,
      "sosaotrungbinh": 3.125,
      "ngaycapnhat": "2023-03-07T01:40:57.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 17,
      "tentruyen": "DEAD MOUNT DEATH PLAY",
      "tenkhac": "",
      "tinhtrang": 1,
      "mota":
          "Một thể loại xuyên không nhưng là xuyên không từ thế giới fantasy sang thế giới hiện đại. một trò chơi hại não và kinh dị bắt đầu",
      "imagelink":
          "https://st.nettruyenup.com/data/comics/203/dead-mount-death-play.jpg",
      "tongluotxem": 2,
      "tongtheodoi": 2,
      "tongdanhgia": 3,
      "sosaotrungbinh": 4.3333,
      "ngaycapnhat": "2023-03-07T01:34:50.000Z",
      "chuongmoinhat": 3
    },
    {
      "id": 22,
      "tentruyen": "OTTOMAN: ÔNG CHỒNG QUỐC DÂN",
      "tenkhac": "オットマン-OTTOMAN",
      "tinhtrang": 1,
      "mota":
          "Soya là một nhân viên văn phòng, suốt ngày chỉ trải qua chuỗi ngày vô vị lặp đi lặp lại,làm con chó cụt đuôi cho sếp lớn , trong khi bản thân lại nuôi dưỡng ước mơ trở thành họa sĩ truyện tranh. Cho đến một ngày,anh bị xe tải đâm nát bét và bị một sinh vật ngoài hành tinh ký sinh vào cơ thể !? Hơn nữa,người vợ Yuka của anh còn bị lũ quái vật bắt nhốt với ý định ăn thịt...! Soya, với quyết tâm trở thành \"OTTOMAN\" đã chạy nhanh hết sức để có thể bảo vệ cho người vợ yêu dấu của mình!*Xuất bản trên tạp chí Weeky young jump bắt đầu từ 5/8",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678171138712_ottoman-ong-chong-quoc-dan.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725225600&Signature=dfYqK1s33ReeWSQ3cyUX0H%2F2DLr4JB4x59Vi5umqjNLudgS47HjiBRLmIs8aPhRERrZSeCdLEDm%2F8si96SVeMRCnNpXzQtxvsmtDgw5wkFW8U25cillEZySlk5IyKbNoNXKpZDNoLl1AayC%2FWAtWivcmZNdv795WvV%2Fo4LITWKk6U06HQ%2B1Z23cxMoXi5wFFXqdPVl6fc3JubUUXaHZW0O5LKxWpE3aA1f0ZZKVdS7f91up8ifuQnDiBii33nrChm8zBnueRAZk1JlL4lDKs%2F0C7dw8uTXQgY5opxs9M6xg9tj1y3cr%2B4I6mdodDA1k%2Bnx2H4b5ZJ1ztP4DVlbX4Dw%3D%3D",
      "tongluotxem": 19,
      "tongtheodoi": 1,
      "tongdanhgia": 0,
      "sosaotrungbinh": null,
      "ngaycapnhat": "2023-03-07T01:14:53.000Z",
      "chuongmoinhat": 4
    },
    {
      "id": 1,
      "tentruyen": "Nanase-san no Koi ga Ijou",
      "tenkhac": "Cô nàng cuồng tình Nanase",
      "tinhtrang": 1,
      "mota":
          "Takahashi đã gặp được Nanase, một cô gái dễ thương và trong sáng thông qua ứng dụng hẹn hò. Quan hệ của cả hai ngày càng tiến triển một cách tốt đẹp rồi bỗng dưng một ngày nọ Takahashi được Nanase mời tới nhà mình chơi và chứng kiến một cảnh tượng bất ngờ",
      "imagelink":
          "https://storage.googleapis.com/app-comic-reading.appspot.com/truyen/1678169651281_co-nang-cuong-tinh-nanase.jpg?GoogleAccessId=firebase-adminsdk-luh5y%40app-comic-reading.iam.gserviceaccount.com&Expires=16725200400&Signature=H8p5Zwq4%2B90Li1i%2FkvglPeR6p4PjYqan4qoBsyeYqPUrWa9F%2FP41X%2FnK2SmYM9yC3eZgO6jNIJ4OCMo%2BdvZPRsHCEGlcSN9riP2hN3gIkEjqFi1U7B00W4KiDMf3qAOCE%2FmUryuH9OZ1j3prSmg6ZIqNnBiyb%2BtBuV4ZmP3rVH0DxLxvIHymVQPVS1LDEmCYQFm7Lh7sippEcn02j0h%2B2LoXib8nv43uOv%2FH9lYpsyWuGcRoSBxvSBnXy8nlrGIhjEKOJVlW1YzQRRkWYuEFATLU%2BLgogUNsaHzRgzU%2BNl0E3OLIlbIIhF3B9lhsSbd%2FtjpTJDHN1%2BKtpIxEts9DDQ%3D%3D",
      "tongluotxem": 194,
      "tongtheodoi": 8,
      "tongdanhgia": 11,
      "sosaotrungbinh": 3.8182,
      "ngaycapnhat": "2023-03-06T23:35:03.000Z",
      "chuongmoinhat": 6
    }
  ];

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 2;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final myColors = Theme.of(context).extension<CustomThemeExtension>()!;

    if (screenWidth > 600) {
      crossAxisCount = 4;
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(top: 16, left: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Truyện đề cử',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    // slide view
                    SlideViewWiget(data: data),
                    Container(
                      width: screenWidth,
                      margin: EdgeInsets.only(top: 10, left: 10, bottom: 16),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Truyện mới cập nhật',
                        style: TextStyle(
                            color: Colors.amber,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    // GridView
                    MyGridViewWidget(
                        data: data2,
                        crossAxisCount: crossAxisCount,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth),
                  ],
                ),
              ),
            ),
            //header bar
            HeaderBarWidget(
              screenWidth: screenWidth,
              myColors: myColors,
              title: 'Trang chủ',
              iconButtonRight: IconButton(
                splashColor: Colors.black,
                splashRadius: 22,
                icon: Icon(Icons.search, color: myColors.blackOrWhite),
                onPressed: () {
                  print('Button timkiem pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
