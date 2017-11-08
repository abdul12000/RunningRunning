package internal.qaauto.inrunning.tom.MyBets;

import internal.qaauto.inrunning.tom.InRunningComponentInterface;

/**
 * @author rkora on 13/01/2015.
 */
public interface MyBets extends InRunningComponentInterface {
    String getMessage();

    void selectBetType(String betType);

    String getBetTypeMessage();

}
