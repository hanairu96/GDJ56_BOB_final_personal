ClassicEditor 
    .create( document.querySelector( '#master-content' ) ) 
    .then( editor => { 
        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );
    

