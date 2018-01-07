import {Socket} from "phoenix";
let socket = new Socket("/socket", {params: {token: "123"}});
socket.connect();
export default socket;