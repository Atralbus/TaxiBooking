import Vue from "vue";
import "axios";
import "./socket"; // To be used later

import customer from "./customer";
import driver from "./driver";
Vue.component("customer", customer);
Vue.component("driver", driver);

new Vue({}).$mount("#takso-app");
