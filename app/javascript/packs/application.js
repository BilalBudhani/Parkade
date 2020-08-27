import Vue from "vue/dist/vue.esm";
import { InertiaApp } from "@inertiajs/inertia-vue";
import VueFormulate from "@braid/vue-formulate";
import VueToast from 'vue-toast-notification';
import axios from "axios";
import "../stylesheets/application";

const app = document.getElementById("app");
axios.defaults.xsrfHeaderName = "X-CSRF-Token";

const files = require.context('../components/common', true, /\.vue$/i)

files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))


Vue.use(InertiaApp);
Vue.use(VueFormulate);
Vue.use(VueToast, {
  position: "top"
});


new Vue({
  render: h =>
    h(InertiaApp, {
      props: {
        initialPage: JSON.parse(app.dataset.page),
        resolveComponent: name => require(`../pages/${name}`).default
      }
    })
}).$mount(app);
