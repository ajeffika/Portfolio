document.addEventListener("turbolinks:load", function() {

var options = {

    strings: ['',I18n.t('sentence1'), I18n.t('sentence2')],
    typeSpeed: 30
};

var typed = new Typed(".element", options);
});