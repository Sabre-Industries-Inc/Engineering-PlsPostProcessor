# PLS-POLE Post Processor

By Mark Rogers

Power Line Systems has provided a way to execute a post processor at the end of a structure analysis. The _Post Processor Options_ definition shown below is from the _PLS-POLE Manual_ (v16.50) section 4.2.4.

4.2.4 Post Processor Options

PLS-POLE users are provided with the ability to post-process the program results. Users who wish to do so can select the post-processing options shown in Fig. 4.2-5 with General/ Post **Processor Options.** (see figure below)

The XML options are the best way to extract data from a **PLS-POLE** run and the only ones supported for new applications. The XML format has the benefit of being self-documenting and enjoys nearly universal support by other tools (such as MS Office, all development environments, etc.). To get started writing a post processor using the XML format all you need to do is select "Write XML post processor file". You can then review the resulting XML file using your preferred development tool. All output items have the same meaning as the corresponding data in the **Analysis Results** report.

The post processor options should be of no concern to the great majority of users except for the following option which may be of interest:

_Automatically save structure model to disk before running the analysis:_ if checked the program will save the structure model whenever you execute the **Model/ Run** command

The purpose of the Post Processor is twofold:

1. To generate DXF and PNG files showing the PLS structure. The PNG will be used for the SUEET GUI and the DXF file will be used to generate the PE Drawing.
2. Create a zip file which will be imported into SUEET. The zip file will contain:
  1. DXF and PNG files.
    1. Front view
    2. Top view
    3. Isometric view
  2. xml
  3. WorkSpace directory – contain all files which are required to run the PLS Pole model.
  4. zip – contain all files which are required to run the PLS Pole model.

The final zip file called _PlsUpload.zip_ will contain all the files described above. The _PlsUpload.zip_ will be imported into SUEET. The zip file is in "C:\pls\temp\stage\PlsUpload.zip".

T ![](RackMultipart20240109-1-43b6f_html_e185a6b5f085e6d.png) he _Post Processor Options_ are found under General -\> Post Processor Options as shown in the snapshot.

Note, when you save the PLS-Pole model, the _Post Processor Options_ settings will be saved as well.

![](RackMultipart20240109-1-43b6f_html_aaec1c5ddc932e1e.png)

Fig 4.2-5

The _Post Processor Options_ dialog shown above provides a way to define a post processor which will run at the end of an analysis. The snapshot shows the options in the blue rectangle which may be set.

1. _Do not use post process_. Select this option if you do not want to run the post processor after every run. However, the final run of the model **must** run the post processor to create the _PlsUpload.zip_ file, which will be imported by SUEET.
2. _Write XML file and run post process_ – when you run the PLS model the PLS GUI will save the postproc.xml file and then run the post processor.
3. _Select post processor executable_… -- define the path to the PLS Post Processor. The PLS Post Processor executable is in "Q:\deploy\PlsPostProcessor\plspp.exe" as shown in the snapshot above.
4. _Automatically save structure model…_ -- The initial run MUST be saved before running the post processor. The .pol file contains paths to all file dependencies. Saving the file will ensure the dependency paths are correct.

Engineering will have two things to do to implement the PLS Post Processor.

1. The PLS template will have the _Post Processor Options_ set as discusses above. At a minimum, the Pls Post Processor executable must be defined. The template will then have the post processor defined for all new projects using the template.
2. For legacy PLS models, the engineer will need to manually define the _Post Processor Options_. The manual definition of the _Post Processor Options_ will ensure the zip file is created. The zip file will be imported into SUEET and saved in the Quote database..

2 **|** Page September 22, 2021
