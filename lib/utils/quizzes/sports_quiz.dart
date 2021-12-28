import '../quiz.dart';
import '../question.dart';

const sportsQuiz = Quiz(
  name: 'Sports',
  questions: [
    Question(
      text: 'Hurling uses a ball called a sliothar',
      answer: true,
    ),
    Question(
      text: 'Pétanque is played with balls',
      answer: true,
    ),
    Question(
      text: 'Polo is not an Olympic sport',
      answer: true,
    ),
    Question(
      text: 'There are 30 balls in the game of snooker',
      answer: false,
    ),
    Question(
      text:
          'An Olympic slalom course must have a vertical drop of less than 200 feet',
      answer: false,
    ),
    Question(
      text: 'There has never been a woman chess master',
      answer: false,
    ),
    Question(
      text: 'The game mah-jongg takes its name from a mythical bird',
      answer: true,
    ),
    Question(
      text: 'Monica Seles, the tennis player, never earned a prize title',
      answer: false,
    ),
    Question(
      text: 'In the Tour de France, the winner wears a yellow jersey',
      answer: true,
    ),
    Question(
      text: ' A dartboard is divided into 20 numbered sections',
      answer: true,
    ),
  ],
);
