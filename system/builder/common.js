(function(exports) {

    // Define all your functions on the exports object                                                                                                             
    exports.foo = function() {
	return 'bar';
    };

})((typeof process === 'undefined' || !process.versions)
   ? window.common = window.common || {}
   : exports);
