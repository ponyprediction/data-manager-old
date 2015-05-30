#-------------------------------------------------
#
# Project created by QtCreator 2015-05-19T20:32:00
#
#-------------------------------------------------

QT       += core network

QT       -= gui

TARGET = data-manager
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    util.cpp \
    download-manager.cpp \
    manager.cpp \
    parser.cpp \
    job-creator.cpp \
    database-manager.cpp

HEADERS += \
    util.hpp \
    download-manager.hpp \
    manager.hpp \
    parser.hpp \
    job-creator.hpp \
    database-manager.hpp \
    VT100.h

DISTFILES += \
    conf.xml \
    database-organisation.xml \
    manual

macx: LIBS += -L/usr/local/lib -lmongoclient -lboost_thread-mt -lboost_system -lboost_regex
macx: INCLUDEPATH += /usr/local/include

unix:!macx: LIBS += -L$$PWD/../../../stuff/mongo-client-install/lib/ -lmongoclient -lmongoclient -lboost_thread -lboost_system -lboost_regex

unix:!macx:INCLUDEPATH += $$PWD/../../../stuff/mongo-client-install/include
unix:!macx:DEPENDPATH += $$PWD/../../../stuff/mongo-client-install/include

unix:!macx: PRE_TARGETDEPS += $$PWD/../../../stuff/mongo-client-install/lib/libmongoclient.a
