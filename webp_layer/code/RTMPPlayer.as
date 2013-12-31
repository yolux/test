
package code {
		
	import flash.display.MovieClip;
	import flash.events.NetStatusEvent;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Camera;
	import flash.media.Microphone;
	import flash.media.Video;
	
	public class RTMPPlayer extends MovieClip {
		
		public var netconn:NetConnection;
		public var netstream:NetStream;
		public var video:Video;
		
		public function RTMPPlayer() {
		}
		
		public function initConnect(url:String):void {
			netconn = new NetConnection();
			video = new Video();
			//public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
			netconn.addEventListener(NetStatusEvent.NET_STATUS, eNetStatus, false, 0, true);
			netconn.connect(url);
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
				
					netstream.client = {};
					//netstream.client.onMetaData = onMetaData;
					
					netstream.client.onPlayStatus = function(infoObject:Object) {
						//trace("NetStream.onPlayStatus called: ("+getTimer()+" ms)");
						for (var prop in infoObject) {
							trace("\t"+prop+":\t"+infoObject[prop]);
						}
						trace("");
					};
					
					var i:int, f_name:String;
					netstream.play("mp4:amazons3/wowza2.s3.tokyo/liveorigin/mystream_0.mp4",0,-1);
					for (i=1;i<100;i++)
					{
						var path = "mp4:amazons3/wowza2.s3.tokyo/liveorigin/mystream_" + i + ".mp4";
						//trace("play "+path+" called begin : ("+getTimer()+" ms)");
						netstream.play(path,0,-1,false);
						//trace("play "+path+" called end : ("+getTimer()+" ms)");
					}
				
				break;
				default:
					;
			}
		}
		
		private function onMetaData(item:Object):void {
			trace("metaData");
			//for (var prop in Object)
		}
	}
	
}