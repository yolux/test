package code {
	import flash.display.MovieClip;
	import code.RTMPPlayer;
	
	public class BesPlayer extends MovieClip {
		
		public var curPlayer:RTMPPlayer;
		
		public function BesPlayer() {
			init();
		}
		
		public function init():void {
			curPlayer = new RTMPPlayer();
			addChild(curPlayer);
			curPlayer.initConnect("rtmp://54.250.149.50/vods3/");
		}
		
		public function destroy():void {
			stop();
			curPlayer.destroyConnect();
			removeChild(curPlayer);
			curPlayer = null;
		}
		
	}
	
}

