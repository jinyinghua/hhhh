import newpageTest from './newpage.test'
import localUnitTest from './LocalUnit.test';

export default function testsuite() {
  localUnitTest();
  newpageTest()
}