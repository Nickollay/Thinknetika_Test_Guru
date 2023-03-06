export class TimerCountdown {
  constructor(minutesToLeft, testPassageId) {
    this.minutesToLeft = minutesToLeft
    this.testPassageId = testPassageId

    this.countdown()
  }

  countdown() {
    let distance = this.minutesToLeft * 60
    let test_passage_id = this.testPassageId

    let x = setInterval(function() {
      let hours = Math.floor(distance / (60 * 60 ))
      let minutes = Math.floor((distance % (60 * 60)) / 60)
      let seconds = Math.floor(distance % 60)

      document.getElementById("timer").innerHTML = hours + "h " + minutes + "m " + seconds + "s "

      distance -= 1

      if (distance < 0) {
        // location.replace(location.origin + `/test_passages/${test_passage_id}/result`)

        document.getElementById('current_question').submit();
      }
    }, 1000)
  }
}
