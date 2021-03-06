// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');
var finalVideoId;

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function setVideoId(vidId) {
  console.log("Help");
  finalVideoId = vidId;
  console.log(finalVideoId);
}

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubeIframeAPIReady() {
  console.log("help");
  player = new YT.Player('player', {
    height: '390',
    width: '640',
    videoId: 'H3q2F1_3Vjk',
    playerVars: {'rel': 0}
  });
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  event.target.playVideo();
}

function pauseVideo(){
  player.pauseVideo();
}

function playVideo(){
  player.playVideo();
}

function stopVideo() {
  player.stopVideo();
}