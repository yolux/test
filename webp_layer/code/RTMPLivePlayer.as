
package code {
		
	import flash.display.MovieClip;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.Video;
	
	public class RTMPLivePlayer extends MovieClip {
		
		public var netconn:NetConnection;
		public var netstream:NetStream;
		public var video:Video;
		
		public function RTMPLivePlayer() {
		}
		
		public function initConnect(url:String):void {
			netconn = new NetConnection();
			video = new Video();
			netconn.client = {onBWDone:onNetConnectionBWDone};
			//public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
			netconn.addEventListener(NetStatusEvent.NET_STATUS, eNetStatus, false, 0, true);
			netconn.connect("rtmp://54.250.149.50/live-origin-record/");
			netstream = null;
		}
		
		public function destroyConnect():void {
			video.attachNetStream(null);
			removeChild(video);
			netconn.removeEventListener(NetStatusEvent.NET_STATUS, eNetStatus);
			netconn = null;
		}
		
		private function eNetStatus(e:NetStatusEvent):void {
			trace(e.info.code);
			switch (e.info.code) {
				case "NetConnection.Connect.Success":
					netstream = new NetStream(netconn);
					addChild(video);
					video.attachNetStream(netstream);
					netstream.client = {onMetaData:onMetaData, onPlayStatus :onPlayStatus};
					netstream.play("mystream3_aac");
				break;
				default:
					;
			}
		}
		
		private function onMetaData(item:Object):void {
			//trace("metaData");
			//for (var prop in Object)
		}
		private function onNetConnectionBWDone():void{}
		private function onPlayStatus(o:Object):void{}
	}
	
}