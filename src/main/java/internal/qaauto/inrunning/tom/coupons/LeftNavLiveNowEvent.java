package internal.qaauto.inrunning.tom.coupons;

/**
 * Created by Harish Renukunta on 03/10/2014.
 */
public interface LeftNavLiveNowEvent extends LeftNavEvent {

    public boolean isClockRunning();

    public String getClock();

    public String getPeriod();

    public String getGameID();

}
