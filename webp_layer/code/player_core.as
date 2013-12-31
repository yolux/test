package code {
	
	import flash.display.MovieClip;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.Video;
	
	
	public class player_core extends MovieClip {
		
		public var netconn:NetConnection;
		public var netstream:NetStream;
		
		public function player_core() {
			// constructor code
			establishConnect();
		}
		
		public function establishConnect():void {
			// Establish Connection
			netconn = new NetConnection();
			//public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
			netconn.addEventListener(NetStatusEvent.NET_STATUS, eNetStatus, false, 0, true);
			netconn.connect("rtmp://54.250.149.50/vods3/");
			netstream = null;
			// Establish Stream
			// note, we use previously instantiated NetConnection
			////var ns:NetStream = new NetStream(nc); 
			// start playback
			////ns.play("mp4:amazons3/wowza2.s3.tokyo/liveorigin/mystream_0.mp4");
			// Play Stream in a Video
			// note, we use NetStream instance
			////var video:Video = new Video();
			////video.attachNetStream(ns);
		}
		
		public function dispose():void {
          // clean up after ourself!
          stop();
		  netconn.removeEventListener(NetStatusEvent.NET_STATUS, eNetStatus);
          //stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
          //removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		  netconn = null;
		}
		
		public function eNetStatus(e:NetStatusEvent):void {
			trace(e.info.code);
			switch (e.info.code) {
				case "NetConnection.Connect.Success":
					netstream = new NetStream(netconn);
				default:
					;
			}
		}
	}
	
}
