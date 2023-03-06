export class TimerCountdown {
  constructor(secondsToLeft, testPassageId) {
    this.secondsToLeft = secondsToLeft
    this.testPassageId = testPassageId

    this.countdown()
  }

  countdown() {
    let distance = this.secondsToLeft
    let test_passage_id = this.testPassageId

    let x = setInterval(function() {
      let hours = Math.floor(distance / (60 * 60 ))
      let minutes = Math.floor((distance % (60 * 60)) / 60)
      let seconds = Math.floor(distance % 60)

      document.getElementById("timer").innerHTML = hours + "h " + minutes + "m " + seconds + "s "

      distance -= 1

      if (distance < 0) {
        document.getElementById('current_question').submit();
      }
    }, 1000)
  }
}
