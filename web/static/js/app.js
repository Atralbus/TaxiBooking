import Vue from "vue";
import "axios";
import "./socket"; // To be used later

import customer from "./customer";
Vue.component("customer", customer);

new Vue({}).$mount("#takso-app");
