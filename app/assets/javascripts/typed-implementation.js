document.addEventListener("turbolinks:load", function() {

var options = {

    strings: ['',I18n.t('sentence1'), I18n.t('sentence2'), I18n.t('sentence3')],
    typeSpeed: 45,
    backSpeed: 15,
    smartBackspace: true
};

var typed = new Typed(".element", options);
});