import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class AsyncTest {
    private boolean passed=false;
    private CountDownLatch signal = new CountDownLatch(1);
    private int timeoutSeconds;

    public AsyncTest(int timeoutSeconds){
        this.timeoutSeconds=timeoutSeconds;
    }

    public boolean runTest(Test test) throws InterruptedException {
        test.run();
        signal.await(timeoutSeconds, TimeUnit.SECONDS);
        return passed;
    }

    public void pass(){
        passed=true;
        signal.countDown();
    }

    public interface Test{
        public void run();
    }
}
