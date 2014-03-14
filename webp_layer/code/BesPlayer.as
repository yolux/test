package code {
	import flash.display.MovieClip;
	//import code.RTMPPlayer;
	import code.RTMPLivePlayer;
	
	public class BesPlayer extends MovieClip {
		
		//public var curPlayer:RTMPPlayer;
		public var curPlayer:RTMPLivePlayer;
		
		public function BesPlayer() {
			init();
		}
		
		public function init():void {
			//curPlayer = new RTMPPlayer();
			curPlayer = new RTMPLivePlayer();
			addChild(curPlayer);
			curPlayer.initConnect("rtmp://54.250.149.50/live-origin-record/mystream3_aac");
			//curPlayer.initConnect("rtmp://54.250.149.50/vods3/");
		}
		
		public function destroy():void {
			stop();
			curPlayer.destroyConnect();
			removeChild(curPlayer);
			curPlayer = null;
		}
		
	}
	
}

