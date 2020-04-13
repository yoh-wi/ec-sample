// $(function() {
//   function buildImg(index, url){
//     var imgHtml = `<div class='js-preview' data-index="${index}">
//                     <div class='js-img'>
//                       <img data-index="${index}" src="${url}" width="120px" height="100px">
//                     </div>
//                     <div class="js-remove">削除</div>
//                    </div>`;
//     return imgHtml
//   }
// })
// $(document).on('turbolinks:load', ()=> {
//   $(function() {
//     //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
//     $('#wwww').on('mouseover', function(e) {
//       console.log("3333")
//       var file = e.target.files[0],
//           reader = new FileReader(),
//           $preview = $(".item__new__box__image--view");
//           t = this;
      
//       // 画像ファイル以外の場合は何もしない
//       // if(file.type.indexOf("image") < 0){
//       //   return false;
//       // }
//       console.log("3333")
//       // ファイル読み込みが完了した際のイベント登録
//       reader.onload = (function(file) {
//         return function(e) {
//           //既存のプレビューを削除
//           $preview.empty();
//           // .prevewの領域の中にロードした画像を表示するimageタグを追加
//           $preview.append($('<img>').attr({
//                     src: e.target.result,
//                     width: "150px",
//                     class: "preview",
//                     title: file.name
//                 }));
//         };
//       })(file);

//       reader.readAsDataURL(file);
//     });
//   });
// });