import '../quiz.dart';
import '../question.dart';

const musicQuiz = Quiz(
  name: 'Music',
  questions: [
    Question(
      text: 'A cello is the largest stringed instrument',
      answer: false,
    ),
    Question(
      text: 'Mozart was born in Russia',
      answer: false,
    ),
    Question(
      text: 'There is an instrument called a piccolo trumpet',
      answer: true,
    ),
    Question(
      text: 'Handel wrote a famous oratorio called "Messiah"',
      answer: true,
    ),
    Question(
      text: 'The viola plays music printed in Viola (aka Alto) Clef',
      answer: true,
    ),
    Question(
      text: 'The alto saxophone is the smallest saxophone there is',
      answer: false,
    ),
    Question(
      text: 'A normal piano has 89 total keys, including the black keys',
      answer: false,
    ),
    Question(
      text: 'Beethoven died completely deaf',
      answer: true,
    ),
    Question(
      text:
          'A piccolo has the highest pitch of any instrument in the orchestra',
      answer: true,
    ),
    Question(
      text:
          '"In The Hall of the Mountain King" was written by a French composer',
      answer: false,
    ),
  ],
);
