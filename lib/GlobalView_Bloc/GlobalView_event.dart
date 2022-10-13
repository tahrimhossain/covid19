

class GlobalViewEvent
{
  GlobalViewEvent();
}

class LoadGlobalViewEvent extends GlobalViewEvent{
  LoadGlobalViewEvent():super();
}

class TransitionToOtherPageFromGlobalView extends GlobalViewEvent{
  TransitionToOtherPageFromGlobalView():super();
}