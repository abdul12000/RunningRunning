package internal.qaauto.inrunning.StepCandidatesHelperMethods;

/**
 * Created by Harish Renukunta on 17/10/2014.
 */
public class HelperFactory {

    private static EventStepsHelperMethods eventStepsHelper;

    private static LiveBettingStepMethods lifeBettingStepsHelper;

    private static LeftNavEventStepsHelperMethods couponStepsHelper;

    private static CouponAreaStepsHelperMethods couponAreaStepsHelper;

    private static BetslipHelperMethods betslipStepsHelper;


    public static EventStepsHelperMethods getEventStepsHelper(){
        if(eventStepsHelper == null){
            eventStepsHelper = new EventStepsHelperMethods();
        }
        return eventStepsHelper;
    }

    public static LiveBettingStepMethods getLifeBettingStepMethods(){
        if(lifeBettingStepsHelper == null){
            lifeBettingStepsHelper = new LiveBettingStepMethods();
        }
        return lifeBettingStepsHelper;
    }

    public static LeftNavEventStepsHelperMethods getCouponStepsHelper(){
        if(couponStepsHelper == null){
            couponStepsHelper = new LeftNavEventStepsHelperMethods();
        }
        return couponStepsHelper;

    }

    public static CouponAreaStepsHelperMethods getCouponAreaStepsHelper(){
        if(couponAreaStepsHelper == null){
            couponAreaStepsHelper = new CouponAreaStepsHelperMethods();
        }
        return couponAreaStepsHelper;
    }
    public static BetslipHelperMethods getBetslipStepsHelper(){
        if(betslipStepsHelper==null){
            betslipStepsHelper=new BetslipHelperMethods();
        }
        return betslipStepsHelper;
    }


}