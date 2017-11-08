package internal.qaauto.inrunning.tom.Utilties;

import internal.qaauto.inrunning.tom.LiveBettingPage;
import internal.qaauto.inrunning.tom.LiveBettingPageImpl;
import internal.qaauto.inrunning.tom.leftnav.LeftNavMenu;

/**
 * Created by Harish Renukunta on 10/10/2014.
 */
public class LiveBettingPageFactory {

    private static LiveBettingPageImpl liveBettingPageImpl;

    public static LiveBettingPage getLiveBettingPageImpl(){
        try{
                if(liveBettingPageImpl == null){
                    liveBettingPageImpl = new LiveBettingPageImpl();
                }else {
                    final LeftNavMenu leftNavMenu = liveBettingPageImpl.getLeftNav();
                }

        } catch (Exception ex){
                liveBettingPageImpl = new LiveBettingPageImpl();
            }
         return liveBettingPageImpl;
    }
}

