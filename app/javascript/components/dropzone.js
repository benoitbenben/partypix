import 'dropzone';
// import "dropzone/dist/dropzone.js";
import Dropzone from 'dropzone';
import 'dropzone/dist/dropzone.css';

Dropzone.autoDiscover = false;

let csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

var dropzone = new Dropzone("#dropzone-upload",
  {
    paramName: "photo",
    addRemoveLinks: true,
    init: function() {
      this.on("removedfile", function(file) {
        let response  = JSON.parse(file.xhr.response);
        let pictureId = response.picture_id;

        fetch(`/pictures/${pictureId}`, {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            'X-CSRF-Token': csrfToken
          },
          credentials: 'same-origin'
        })
          // .then(response => response.json())
          // .then((data) => {
          //   console.log('picture deleted!');
          // });
      });
    }
  }
);
