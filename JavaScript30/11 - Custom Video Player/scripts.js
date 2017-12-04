const player = document.querySelector('.player');
const video = player.querySelector('.viewer');
const progress = player.querySelector('.progress');
const progressBar = player.querySelector('.progress__filled');

const toggle = player.querySelector('.toggle');
const skipButtons = player.querySelectorAll('[data-skip]');
const ranges = player.querySelectorAll('.player__slider');

let sliderMoving = false;


function togglePlay() {
  const method = video.paused ? 'play' : 'pause';
  video[method]();
}

function updateButton() {
  const icon = this.paused ? '►' : '❚ ❚';
  toggle.textContent = icon;
}

function skip() {
  video.currentTime += parseFloat(this.dataset.skip);
}

function handleRangeUpdate() {
  if (sliderMoving) {
    video[this.name] = this.value;
  }
}

function handleKey(e) {
  if (e.keyCode === 32) {
    togglePlay();
  }
}

function handleProgress() {
  const percent = (video.currentTime / video.duration) * 100;
  progressBar.style.flexBasis = `${percent}%`;
}

function scrub(e) {
  const scrubTime = (e.offsetX / progress.offsetWidth);
  progressBar.style.flexBasis = `${scrubTime * 100}%`;
  video.currentTime = scrubTime * video.duration;
}

video.addEventListener('play', updateButton);
video.addEventListener('pause', updateButton);
document.addEventListener('keypress', handleKey);
video.addEventListener('click', togglePlay);
video.addEventListener('timeupdate', handleProgress);
toggle.addEventListener('click', togglePlay);

skipButtons.forEach(button => {
  button.addEventListener('click', skip);
});

ranges.forEach(range => {
  range.addEventListener('mousedown', () => sliderMoving = true);
  range.addEventListener('mousemove', handleRangeUpdate);
  range.addEventListener('mouseup', () => sliderMoving = false);
});

let sliderMouseDown = false;
progress.addEventListener('click', scrub);
progress.addEventListener('mousedown', () => sliderMouseDown = true);
progress.addEventListener('mouseup', () => sliderMouseDown = false);
progress.addEventListener('mouseout', () => sliderMouseDown = false);
progress.addEventListener('mousemove', (e) => sliderMouseDown && scrub(e));
